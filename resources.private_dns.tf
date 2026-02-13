resource "azurerm_private_dns_zone" "main" {
  name                = resource.azurerm_container_app_environment.container_env.default_domain
  resource_group_name = var.container_app_env.resource_group
  tags                = lookup(var.container_app_env,"tags_dns",null)
}

resource "azurerm_private_dns_zone_virtual_network_link" "main" {
  name                  = format("%s-link",var.container_app_env.name)
  resource_group_name   = var.container_app_env.resource_group
  private_dns_zone_name = azurerm_private_dns_zone.main.name
  virtual_network_id    = var.container_app_env.vnet_id
    tags                = lookup(var.container_app_env,"tags_dns",null)
}

resource "azurerm_private_dns_a_record" "main" {
  name                = "*"
  zone_name           = azurerm_private_dns_zone.main.name
  resource_group_name = var.container_app_env.resource_group
  ttl                 = 60
  records             = [resource.azurerm_container_app_environment.container_env.static_ip_address]
}