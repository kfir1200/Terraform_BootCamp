
variable "vm_name" {
  description = "the name of the virtual Machine"
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource"
  type        = string
}

variable "vm_type" {
  description = "the type of the Virtual Machine scale set"
  type = string
}

variable "admin_username" {
  description = "the user name of the Virtual Machine"
    type = string
}

variable "vm_password" {
  description = "the password of the Virtual Machine"
  type = string

}

variable "pass_auth" {
  description = "enable password authentication"
  type = bool
  default = false
}

variable "image_publisher" {
  description = "image publisher"
  default = "Canonical"
  type = string
}
variable "image_offer" {
  description = "image offer"
  default = "0001-com-ubuntu-server-focal"
}
variable "image_sku" {
  description = "image sku"
  default = "20_04-lts-gen2"
  type = string
}

variable "image_version" {
  description = "image version"
  default = "latest"
  type = string
}

variable "os_disk_caching" {
  description = "os disk caching"
  default = "ReadWrite"
  type = string
}

variable "os_disk_storage_type" {
  description = "os disk storage account type"
  default = "Standard_LRS"
  type = string
}

variable "subnet_id" {
  description = "the sunet id for nic association"
  type = string
}

variable "lb_backend_address_id" {
  description = "the backend id of the load balancer "
  default = null
}

variable "instance_count" {
  description = "instance count"
  type = number
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "env_prefix" {
  description = "prefix for staging / prod name"
  type = string
}

variable "associate_load_balancer" {
  description = "select true if you want to associate the vm with load balancer"
  type = bool
  default = false
}

variable "associate_public_ip" {
  description = "select true if you want to associate the vm with public ip"
  type = bool
  default = false
}