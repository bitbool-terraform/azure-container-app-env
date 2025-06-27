resource "azurerm_private_dns_zone" "main" {
  name                = resource.azurerm_container_app_environment.container_env.default_domain
  resource_group_name = var.resource_group
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  resource_group_name = var.resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "main" {
  name                  = format("%s-link",var.env_name)
  resource_group_name   = var.resource_group
  private_dns_zone_name = azurerm_private_dns_zone.main.name
  virtual_network_id    = data.azurerm_virtual_network.vnet.id
}

resource "azurerm_private_dns_a_record" "main" {
  name                = "*"
  zone_name           = azurerm_private_dns_zone.main.name
  resource_group_name = var.resource_group
  ttl                 = 60
  records             = [resource.azurerm_container_app_environment.container_env.static_ip_address]
}