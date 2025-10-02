# Azure Virtual Network Configuration

resource "azurerm_virtual_network" "main" {
   name                = "main-network"
   address_space       = ["10.0.0.0/16"]
   location            = "East US"
   resource_group_name = "cloud-infrastructure-rg"
}

resource "azurerm_subnet" "internal" {
   name                 = "internal"
   resource_group_name  = "cloud-infrastructure-rg"
   virtual_network_name = azurerm_virtual_network.main.name
   address_prefixes     = ["10.0.2.0/24"]
}