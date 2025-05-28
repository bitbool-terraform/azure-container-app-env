output "env_id" {
  value = resource.azurerm_container_app_environment.container_env.id
}

output "default_domain" {
  value = resource.azurerm_container_app_environment.container_env.default_domain
}

output "static_ip_address" {
  value = resource.azurerm_container_app_environment.container_env.static_ip_address
}

