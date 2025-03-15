variable "group_memberships" {
  type = map(object({
    group_id = string
    user_id  = string
  }))
}