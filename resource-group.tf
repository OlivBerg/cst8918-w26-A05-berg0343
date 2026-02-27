resource "azurerm_resource_group" "project_rg" {
  name     = "${var.labelPrefix}-A05-RG"
  location = var.location
}