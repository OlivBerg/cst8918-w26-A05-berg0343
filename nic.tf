resource "azurerm_network_interface" "web_nic" {
  name                = "${var.labelPrefix}-nic"
  location            = azurerm_resource_group.project_rg.location
  resource_group_name = azurerm_resource_group.project_rg.name

  ip_configuration {
    name                          = "webserver-ipconfig"
    subnet_id                     = azurerm_subnet.web_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.webserver_ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "web_nic_nsg_association" {
  network_interface_id      = azurerm_network_interface.web_nic.id
  network_security_group_id = azurerm_network_security_group.web_nsg.id
}