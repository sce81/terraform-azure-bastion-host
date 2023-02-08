data "azurerm_resource_group" "main" {
  name = var.resource_group
}

locals {
  common_tags = tomap({
    Environment = var.environment
    Terraform   = "true"
  })

  // keyvault_policy = var.keyvault_policy != null ? 1 : 0
}