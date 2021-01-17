web_server_location      = "centralus"
web_server_rg            = "web-rg"
resource_prefix          = "web-server"
web_server_name          = "web"
environment              = "production"
web_server_count         = 2
terraform_script_version = "1.0.0"
domain_name_label        = "jlhazcourse2021"
location_settings = {
  centralus = {
    location      = "centralus"
    address_space = "1.0.0.0/22"
    subnets = {
      web-server         = "1.0.1.0/24"
      AzureBastionSubnet = "1.0.2.0/24"
    }
  },
  eastus2 = {
    location      = "eastus2"
    address_space = "2.0.0.0/22"
    subnets = {
      web-server         = "2.0.1.0/24"
      AzureBastionSubnet = "2.0.2.0/24"
    }
  }
}
