terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "rg-stg"
    storage_account_name = "storagefirst123"
    key                  = "foreach.tfstate"
    container_name       = "tfstate"

  }
}

provider "azurerm" {
  features {}
  subscription_id = "d8764aa6-fc0a-4ae2-a471-a855c00b6940"

}