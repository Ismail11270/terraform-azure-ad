# Create Azure AD Users
resource "azuread_user" "users" {
  for_each = var.users

  user_principal_name = each.value.user_principal_name
  display_name        = each.value.display_name
  mail_nickname       = each.value.mail_nickname
  password            = each.value.password
}