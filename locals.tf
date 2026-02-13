locals {

infrastructure_resource_group_name = lookup(var.container_app_env,"infrastructure_resource_group_name",format("%s-%s-infra",var.container_app_env.resource_group,var.container_app_env.name))

}