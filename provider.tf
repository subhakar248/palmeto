terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.10.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.3"
    }
    ansible = {
      source = "ansible/ansible"
      version = "1.3.0"
    }
  }
}

provider "azurerm" {
  features{}
}

