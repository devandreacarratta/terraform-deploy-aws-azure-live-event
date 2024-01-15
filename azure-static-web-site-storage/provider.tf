terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.86.0"
    }
  }
}


provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "resource_group" {
  name     = "${var.project}-${var.environment}-rg"
  location = var.location
}
