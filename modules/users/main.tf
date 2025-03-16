resource "random_password" "example" {
  length  = 32
  special = true
  lower   = true
  upper   = true
  numeric  = true
}

resource "azuread_user" "users" {
  for_each = { for user in var.users : user.Email => user }

  user_principal_name = each.value.Email
  display_name        = each.value.Name
  mail_nickname       = split("@", each.value.Email)[0] # Derive mail_nickname from email
  password = random_password.example.result
  lifecycle {
    ignore_changes = [
      password
    ]
  }
}