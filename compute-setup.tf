# Azure VM Configuration

resource "azurerm_linux_virtual_machine" "main" {
   name                  = "app-server"
   resource_group_name   = "cloud-infrastructure-rg"
   location              = "East US"
   size                  = "Standard_B1s"
   admin_username        = "adminuser"
   network_interface_ids = [azurerm_network_interface.main.id]
   
   admin_ssh_key {
      username   = "adminuser"
      public_key = file("~/.ssh/id_rsa.pub")
   }
   
   os_disk {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
   }
   
   source_image_reference {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
   }
}