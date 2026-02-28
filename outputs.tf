output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.project_rg.name
}

output "webserver_public_ip" {
  description = "The public IP address of the web server"
  value       = azurerm_public_ip.webserver_ip.ip_address
}

output "webserver_vm_name" {
  description = "The name of the web server virtual machine"
  value       = azurerm_linux_virtual_machine.web_vm.name
}