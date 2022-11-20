variable "environment_tag" {
  type        = string
  description = "Environment tag value"
  default = "subba"
}
variable "azure-rg-1" {
  type        = string
  description = "resource group 1"
  default = "WW-CloudServiceManagement-RG-TBDNov30"
}
variable "loc1" {
  description = "The location for this Lab environment"
  type        = string
  default = "East US"
}
