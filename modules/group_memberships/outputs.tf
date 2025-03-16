output "group_membership_ids" {
  value = { for k, v in azuread_group_member.group_members : k => v.id }
  description = "Map of group membership IDs."
}