# General
variable "container_app_env" {}

# Defaults
variable "internal_load_balancer_enabled_default" { default = true}
variable "zone_redundancy_enabled_default" { default = false}
variable "identity_ids" { default = [] }


variable "zone_redundancy_enabled" { default = false}

variable "workload_profiles_default" { default = {    
    Consumption = {
      type = "Consumption"
      minimum_count = 0
      maximum_count = 0
    }
    }}
