variable "name" {}
variable "sku" { default = "Standard" }
variable "subnet_id" {}
variable "resource_group" {}
variable "environment" {}
variable "extra_tags" {
  type    = map(any)
  default = {}
}