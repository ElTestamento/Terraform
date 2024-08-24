resource "azurerm_resource_group" "TOPrg" {
  name     = var.azure_rg_name
  location = var.azure_location

  tags = local.tags

}
#create virtual network
resource "azurerm_virtual_network" "TOPvnet" {
  name                = var.virtual_network_name
  address_space       = ["10.30.0.0/16"]
  location            = azurerm_resource_group.TOPrg.location
  resource_group_name = azurerm_resource_group.TOPrg.name

  tags = local.tags
}

#create subnet
resource "azurerm_subnet" "TOPsubnet" {
  name                 = var.virtual_network_name
  resource_group_name  = azurerm_resource_group.TOPrg.name
  virtual_network_name = azurerm_virtual_network.TOPvnet.name
  address_prefixes     = ["10.30.1.0/24"]
}

#create public IP

resource "azurerm_public_ip" "TOP_pIP" {
  name                = var.public_IP
  location            = azurerm_resource_group.TOPrg.location
  resource_group_name = azurerm_resource_group.TOPrg.name
  allocation_method   = "Dynamic"

  tags = local.tags
}

resource "azurerm_network_security_group" "TOPnsg" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.TOPrg.location
  resource_group_name = azurerm_resource_group.TOPrg.name

  tags = local.tags

}

#create security group rules

resource "azurerm_network_security_rule" "TOPnwsrule" {
  name                        = "allow_HTTP"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.TOPrg.name
  network_security_group_name = azurerm_network_security_group.TOPnsg.name

}