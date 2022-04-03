
variable "resource_group_name" {
  description = "The name of a resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource"
  type        = string
  default     = "eastus"
}
variable "private_dns_name" {
  description = "private dns name"
  type        = string
}
variable "private_dns_link_name" {
  description = "private dns link name"
  type        = string
}
variable "managed_db_name" {
  description = "The name of the managed db resource"
  type        = string
}
variable "managed_db_version" {
  description = "The version of psql"
  type        = string
  default     = "13"
}
variable "subnet_id" {
  description = "delegated_subnet_id"
  type        = string
}
variable "managed_db_admin_user_name" {
  description = "The admin user name for connection to the managed db"
  type        = string
}
variable "managed_db_admin_password" {
  description = "The admin password for connection to the managed db"
  type        = string
  sensitive = true
}

variable "zone" {
  description = "the zone of the managed db"
  type = string
  default = "1"
}

variable "storage" {
  description = "the storage of the managed db in MB unit"
  type = number
  default = 32768
}

variable "sku" {
  description = "the type of the managed db"
  type = string
  default = "B_Standard_B1ms"
}

variable "vnet_id" {
  description = "the id of the vnet"
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "env_prefix" {
  description = "prefix for staging / prod name"
  type = string
}


