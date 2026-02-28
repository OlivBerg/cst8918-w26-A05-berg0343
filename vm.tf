data "cloudinit_config" "webserver_config" {
  gzip          = false
  base64_encode = true

  part {
    filename     = "init.sh"
    content_type = "text/x-shellscript"
    content      = file("${path.module}/init.sh")
  }
}

resource "azurerm_linux_virtual_machine" "web_vm" {
  name                = "${var.labelPrefix}-web-vm"
  resource_group_name = azurerm_resource_group.project_rg.name
  location            = azurerm_resource_group.project_rg.location
  size                = "Standard_B1s"

  admin_username      = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.web_nic.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("/Users/oliviebergeron/.ssh/id_rsa_azure.pub") # path to your SSH public key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  custom_data = data.cloudinit_config.webserver_config.rendered
}