output "subnet_id" {
  value = azurerm_subnet.lab.id
}

output "net_sec_group_id" {
  value = azurerm_network_security_group.lab.id
}