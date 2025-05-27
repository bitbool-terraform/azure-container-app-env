# General
variable "project" {}
variable "systemenv" {}
variable "location" {}
variable "resource_group" {}
variable "vnet" {}

# Container app Env app object
variable "env_name" {}
variable "env_subnet" {}
variable "workload_profiles" {}


# Config Defaults
variable "internal_load_balancer_enabled" { default = false}
variable "zone_redundancy_enabled" { default = false}
variable "logs_destination" { default = "azure-monitor" }