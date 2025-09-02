terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "rg_new_stg"
    storage_account_name = "storagesliku22082025"
    key                  = "terraform.tfstate"
    container_name       = "tfstate"

  }
}

provider "azurerm" {
  features {}
  # subscription_id = "d8764aa6-fc0a-4ae2-a471-a855c00b6940"
  subscription_id = "f0c6c28a-7429-42b3-aefa-63439e20a651"
}