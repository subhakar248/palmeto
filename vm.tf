resource "azurerm_linux_virtual_machine" "training" {
  name                = "terraform"
  resource_group_name = azurerm_resource_group.training.name
  location            = azurerm_resource_group.training.location
  size                = var.vm_size
  admin_username      = var.admin_username

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  network_interface_ids = [
    azurerm_network_interface.training.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.training.primary_blob_endpoint
  }
}
