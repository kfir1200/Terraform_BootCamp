
variable "resource_group_name" {
  description = "The name of an existing resource group to be imported."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource"
  type        = string
  default     = "eastus"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "the subnet prefixes"
  type        = list(string)
}

variable "vnet_name" {
  description = "the name of the vnet"
  type= string
}


