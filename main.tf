resource "azurerm_public_ip" "main" {
  name                = "${var.name}-bastion-public-ip"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "main" {
  name                = "${var.name}-bastion-host"
  sku                 = "Standard"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  tunneling_enabled  = true
  ip_connect_enabled = true
  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.main.id
  }
  tags = merge(
    local.common_tags, var.extra_tags,
  )
}