variable "users" {
  type = list(object({
    Name   = string
    Email  = string
    Groups = string
  }))
  description = "List of users to create in Azure AD."
}