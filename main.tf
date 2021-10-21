terraform {
    required_version = ">= 0.13"

    required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version =  ">= 2.46.0"
      }
    }
}

provider "azurerm" {
  skip_provider_registration = true
  features{

  }
}

resource "azurerm_resource_group" "example" {
  name     = "example-aula-es22"
  location = "West US"
}

resource "azurerm_virtual_network" "example-aulaes22" {
  name                = "virtualNetwork1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  
  tags = {
    environment = "Production"
    turma = "es22"
    faculdade = "impacta"
  }
}