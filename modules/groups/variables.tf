variable "groups" {
  type = map(object({
    display_name = string
  }))
}