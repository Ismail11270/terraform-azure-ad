output "user_ids" {
  value = { for k, v in azuread_user.users : k => v.id }
}