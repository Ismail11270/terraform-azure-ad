resource "azuread_group_member" "group_members" {
  for_each = var.group_memberships

  group_object_id  = each.value.group_id
  member_object_id = each.value.user_id
}