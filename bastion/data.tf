data "terraform_remote_state" "web" {
  backend = "azurerm"
  config = {
    resource_group_name  = "remote-state-rg"
    storage_account_name = "remotestatetf2021"
    container_name       = "tfstate"
    key                  = "web.tfstate"
  }
}
