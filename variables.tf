variable "tenant_id" {
  type = string
}

variable "users" {
  type = map(object({
    user_principal_name = string
    display_name        = string
    mail_nickname       = string
    password            = string
  }))
}

variable "groups" {
  type = map(object({
    display_name = string
  }))
}

variable "group_memberships" {
  type = map(object({
    group_key = string
    user_key  = string
  }))
}