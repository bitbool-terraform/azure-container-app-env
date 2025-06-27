# General
variable "location" {}
variable "resource_group" {}
variable "vnet" {}
variable "infrastructure_resource_group_name" { default = null}

# Container app Env app object
variable "env_name" {}
variable "env_subnet" {}
variable "workload_profiles" {}


# Config Defaults
variable "internal_load_balancer_enabled" { default = true}
variable "zone_redundancy_enabled" { default = false}
variable "logs_destination" { default = "azure-monitor" }