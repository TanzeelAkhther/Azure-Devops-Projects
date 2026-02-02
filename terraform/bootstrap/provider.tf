terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.57"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "fe7654e3-b6e4-4a23-a299-b2beecb57b27"
}
