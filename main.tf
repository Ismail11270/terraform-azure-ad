provider "azuread" {
  tenant_id = var.tenant_id
}

module "users" {
  source = "./modules/users"

  users = var.users
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

locals {
  group_memberships = {
    for k, v in var.group_memberships : k => {
      group_id = module.groups.group_ids[v.group_key]
      user_id  = module.users.user_ids[v.user_key]
    }
  }
  users_csv = file("${path.module}/users.csv")
  users     = csvdecode(local.users_csv)
}