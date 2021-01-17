output "bastion_host_subnet_centralus" {
  value = module.locations["centralus"].bastion_host_subnet
}

output "bastion_host_subnet_eastus2" {
  value = module.locations["eastus2"].bastion_host_subnet
}
