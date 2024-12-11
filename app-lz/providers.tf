terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0, < 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0, < 4.0.0"
    }
  }
}

# provider "azurerm" {
#   features {
#     resource_group {
#       prevent_deletion_if_contains_resources = false
#     }
#   }
#   client_id     = var.spn-client-id
#   client_secret = var.spn-client-secret
#   tenant_id     = var.spn-tenant-id
#   # subscription_id = local.subscription_id
# }

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}