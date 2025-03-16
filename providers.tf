terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.5.0"
    }
  }
}

provider "azuread" {
  tenant_id = var.tenant_id
}


provider "azuredevops" {
  org_service_url       = "https://dev.azure.com/webbats"
  personal_access_token = var.azuredevops_pat
}