variable "groups" {
  type = map(object({
    display_name = string
  }))
  description = "Map of groups to create in Azure AD."
}