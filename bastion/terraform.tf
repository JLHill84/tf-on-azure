terraform {
  backend "azurerm" {
    resource_group_name  = "remote-state-rg"
    storage_account_name = "remotestatetf2021"
    container_name       = "tfstate"
    key                  = "bastion.tfstate"
  }
}
