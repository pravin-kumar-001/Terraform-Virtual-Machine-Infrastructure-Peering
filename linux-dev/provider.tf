terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.77.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "f3fa29a1-aa6a-4029-bcc2-405531162abb"

  features {}
}