output "group_membership_ids" {
  description = "Map of group membership IDs."
  value       = { for k, v in azuread_group_member.group_members : k => v.id }
}