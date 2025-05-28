locals {

infrastructure_resource_group_name = var.infrastructure_resource_group_name != null ? var.infrastructure_resource_group_name : format("%s-%s-%s",var.resource_group,var.project,var.systemenv)

}