resource "azurerm_container_app_environment" "container_env" {
  location                       = var.container_app_env.location
  name                           = var.container_app_env.name
  resource_group_name            = var.container_app_env.resource_group
  infrastructure_subnet_id       = var.container_app_env.subnet_id
  internal_load_balancer_enabled = lookup(var.container_app_env,"internal_load_balancer_enabled",var.internal_load_balancer_enabled_default)
  zone_redundancy_enabled        = lookup(var.container_app_env,"zone_redundancy_enabled",var.zone_redundancy_enabled_default)
  infrastructure_resource_group_name = local.infrastructure_resource_group_name
  logs_destination               = lookup(var.container_app_env,"log_analytics_workspace_id",null) == null ? null : "log-analytics" 
  log_analytics_workspace_id     = lookup(var.container_app_env,"log_analytics_workspace_id",null)
  tags                           = lookup(var.container_app_env,"tags",null)

  lifecycle {
    ignore_changes = [
      log_analytics_workspace_id
    ]
  }

  dynamic "identity" {
    for_each = var.identity_ids != [] ? [1] : []
    content {
      type         = "UserAssigned"
      identity_ids = var.identity_ids
    }
    
  dynamic "workload_profile" {
    for_each = lookup(var.container_app_env,"workload_profiles",var.workload_profiles_default)

    content {
        name                  = workload_profile.key
        workload_profile_type = lookup(workload_profile.value,"type")
        minimum_count         = lookup(workload_profile.value,"minimum_count")
        maximum_count         = lookup(workload_profile.value,"maximum_count")
    }
  }
}
