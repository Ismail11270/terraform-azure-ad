resource "azuread_group" "groups" {
  for_each = var.groups

  display_name     = each.value.display_name
  security_enabled = true
}