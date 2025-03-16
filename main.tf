data "azuread_domains" "default" {
  only_initial = true
}

locals {
  domain_name = data.azuread_domains.default.domains.0.domain_name
  # Read the CSV file
  users_csv = file("${path.module}/users.csv")

  # Parse the CSV file into a list of objects
  users = csvdecode(local.users_csv)

  # Extract unique groups from the CSV
  csv_groups = toset(flatten([
    for user in local.users : split(";", user.Groups)
  ]))

  # Validate that all groups in the CSV exist in the predefined groups
  invalid_groups = setsubtract(local.csv_groups, keys(var.groups))
  valid_groups   = setintersection(local.csv_groups, keys(var.groups))
  
  # Throw an error if any invalid groups are found
  validate_groups = length(local.invalid_groups) > 0 ? (
    file("ERROR: The following groups in the CSV do not exist: ${join(", ", local.invalid_groups)}")
  ) : null

  # Prepare group memberships
  group_memberships = flatten([
    for user in local.users : [
      for group in split(";", user.Groups) : {
        user_key  = user.Email
        group_key = group
        user_id   = module.users.user_ids[user.Email]
        group_id  = module.groups.group_ids[group]
      } if contains(local.valid_groups, group) # Only include valid groups
    ]
  ])
}

module "users" {
  source = "./modules/users"

  users = local.users
}

module "groups" {
  source = "./modules/groups"

  groups = var.groups
}

module "group_memberships" {
  source = "./modules/group_memberships"

  group_memberships = local.group_memberships

  depends_on = [
    module.users,
    module.groups
  ]
}

resource "azuredevops_user_entitlement" "users" {
  for_each = { for user in local.users : user.Email => user }

  principal_name       = each.value.Email
  account_license_type = "basic" # or "stakeholder" or "basic"
}