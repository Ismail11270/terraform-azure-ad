variable "group_memberships" {
  type = list(object({
    user_key  = string
    group_key = string
    user_id   = string
    group_id  = string
  }))
  description = "List of group memberships to create in Azure AD."
}