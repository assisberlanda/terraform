terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "assisberlandaterrastate"
    container_name       = "remote-state"
    key                  = "azure-vm-custom-data/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "assisberlandaterrastate"
    container_name       = "remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  }
}