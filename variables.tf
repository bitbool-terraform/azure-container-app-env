# General
variable "location" {}
variable "resource_group" {}
variable "vnet" {}
variable "infrastructure_resource_group_name" { default = null}
variable "tags" { default = {} }

# Container app Env app object
variable "env_name" {}
variable "env_subnet" {}
variable "workload_profiles" {}


# Config Defaults
variable "internal_load_balancer_enabled" { default = true}
variable "zone_redundancy_enabled" { default = false}
variable "tags_dns" { default = null }
variable "log_analytics_workspace_id" { default = null }
variable "logs_destination" { default = null }
