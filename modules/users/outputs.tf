output "user_ids" {
  value = { for k, v in azuread_user.users : k => v.object_id }
  description = "Map of user emails to their Azure AD IDs."
}

output "user_passwords" {
  value     = { for k, v in azuread_user.users : k => v.password }
  sensitive = true
  description = "Map of user emails to their auto-generated passwords."
}