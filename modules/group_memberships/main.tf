resource "azuread_group_member" "group_members" {
  for_each = {
    for assignment in var.group_memberships : "${assignment.user_key}.${assignment.group_key}" => assignment
  }

  group_object_id  = each.value.group_id
  member_object_id = each.value.user_id
}