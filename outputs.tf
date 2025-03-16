output "user_ids" {
  value = module.users.user_ids
  description = "Map of user emails to their Azure AD IDs."
}

output "group_ids" {
  value = module.groups.group_ids
  description = "Map of group names to their Azure AD IDs."
}

output "group_membership_ids" {
  value = module.group_memberships.group_membership_ids
  description = "Map of group membership IDs."
}

output "user_passwords" {
    value = module.users.password
    description = "Passwords for newly created users"
}

output "azuredevops_user_entitlements" {
  value = { for k, v in azuredevops_user_entitlement.users : k => v.id }
  description = "Map of user emails to their Azure DevOps entitlement IDs."
}