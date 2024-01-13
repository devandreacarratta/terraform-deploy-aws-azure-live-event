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
  name     = "${var.project}-${var.environment}-${random_password.password.result}-rg"
  location = var.location
  tags     = var.tags
}

resource "azurerm_static_site" "static_site" {
  name                = "static-site-${random_password.password.result}"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  sku_tier            = "Free"
  tags                = var.tags
}
