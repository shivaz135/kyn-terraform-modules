  resource "azurerm_resource_group" "this" { #my-rf is the refrence block
  name = "${var.project_name}-${var.environment}-${var.resource_group_name}"
  #kyn-project-dev-rg-gopal
  #variable "resource_group_name" it will pick up the default value
  location = var.location
  tags     = var.tags
}



resource "azurerm_virtual_network" "this" {
  name = "${var.project_name}-${var.environment}-${var.resource_group_name}-vnet"
  #this vnet need location and resource group
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = var.vnet_address_space
  tags                = var.tags
}

resource "azurerm_subnet" "web" {
  name                 = "${var.project_name}-${var.environment}-${var.resource_group_name}-web-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.web_subnet_address
}