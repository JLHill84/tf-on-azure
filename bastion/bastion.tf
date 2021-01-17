provider "azurerm" {
  #   version = "2.2.0"
  features {}
}

resource "azurerm_resource_group" "bastion_rg" {
  name     = var.bastion_rg
  location = var.location
}

resource "azurerm_public_ip" "bastion_pip_centralus" {
  name                = "bastion-ip-centralus"
  location            = var.location
  resource_group_name = azurerm_resource_group.bastion_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# resource "azurerm_public_ip" "bastion_pip_eastus2" {
#   name                = "bastion-ip-eastus2"
#   location            = "eastus2"
#   resource_group_name = azurerm_resource_group.bastion_rg.name
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }

resource "azurerm_bastion_host" "bastion_host_centralus" {
  name                = "bastion-host-centralus"
  resource_group_name = azurerm_resource_group.bastion_rg.name
  location            = var.location

  ip_configuration {
    name                 = "centralus"
    subnet_id            = data.terraform_remote_state.web.outputs.bastion_host_subnet_centralus
    public_ip_address_id = azurerm_public_ip.bastion_pip_centralus.id
  }
}

# resource "azurerm_bastion_host" "bastion_host_eastus2" {
#   name                = "bastion-host-eastus2"
#   resource_group_name = azurerm_resource_group.bastion_rg.name
#   location            = "eastus2"

#   ip_configuration {
#     name                 = "eastus2"
#     subnet_id            = data.terraform_remote_state.web.outputs.bastion_host_subnet_eastus2
#     public_ip_address_id = azurerm_public_ip.bastion_pip_eastus2.id
#   }
# }
