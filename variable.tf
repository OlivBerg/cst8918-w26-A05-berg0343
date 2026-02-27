variable "labelPrefix" {
  description = "Prefix for all resource labels"
  type        = string
  default     = "myapp"
}
variable "region" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "canadacentral"
}
variable "admin_username" {
  description = "Admin username for virtual machines"
  type        = string
  default     = "azureuser"
}
