variable "labelPrefix" {
  description = "Prefix for all resource labels"
  type        = string
  default     = "olivelab6"
}
variable "region" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "westus2"
}
variable "admin_username" {
  description = "Admin username for virtual machines"
  type        = string
  default     = "azureuser"
}
