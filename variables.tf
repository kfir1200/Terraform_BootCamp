
variable "location" {
  description = "The location of the resource"
  type        = string
  default     = "eastus"
}

variable "web_resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  type        = string
  default     = "WEB_SERVER_rsg"
}

variable "vm_password" {
  description = "contain the password in order to connect to the vm machine"
  type        = string
  sensitive   = true
}

variable "managed_db_password" {
  description = "the password for admin managed db "
  type        = string
  sensitive   = true
}
variable "managed_db_admin_user_name" {
  description = "the user name for admin managed db "
  type        = string
  sensitive   = true
}

variable "managed_db_resource_group_name" {
  description = "the default name of the resource group"
  type        = string
  default     = "Managed_DB_SERVER_rsg"
}

variable "my_external_ip" {
  description = "external ip to open port 22 for ssh"
  type        = string
}

variable "admin_user_name" {
  description = "the user name for the vm instances"
  type        = string
}

variable "vm_count" {
  description = "The number of instances to create vm's"
  type        = number
}

variable "env_prefix" {
  description = "prefix for staging  / prod name"
  type        = string
}

variable "tags" {
  type = map(string)
}

variable "vm_type" {
  description = "the type of the Virtual Machine scale set"
  type = string
  default = "Standard_B2s"
}

variable "subnet_prefixes" {
  description = "the subnet prefixes "
  type = list(string)
}
variable "managed_db_subnet_prefixes" {
  description = "the subnet prefixes "
  type = list(string)
}

variable "source_address_prefix" {
  description = "the source addres prefixe for open port 22 in nsg rule "
  type = string
}



