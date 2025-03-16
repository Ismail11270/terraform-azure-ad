variable "tenant_id" {
  type        = string
  description = "The Azure AD tenant ID."
}

variable "groups" {
  type = map(object({
    display_name = string
  }))
  description = "Map of groups to create in Azure AD."
}

variable "azuredevops_pat" {
  type        = string
  description = "Azure DevOps Personal Access Token (PAT)."
  sensitive   = true
}