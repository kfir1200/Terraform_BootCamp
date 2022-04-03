
variable "resource_group_name" {
  description = "The name of an existing resource group to be imported."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource"
  type        = string
  default     = "eastus"
}

variable "vnet_address_space" {
  description = "The address space of the vnet"
  type        = string
}

variable "vnet_name" {

  description = "The name of the virtual network"
  type        = string
}

variable "tags" {
  type = map(string)
  default = {}
}

