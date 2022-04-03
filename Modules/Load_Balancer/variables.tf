
variable "resource_group_name" {
  description = "The name of a resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource"
  type        = string
  default     = "eastus"
}
variable "lb_name" {
  description = "Load Balancer Name "
  type        = string

}
variable "lb_ip_allocation" {
  description = "Load Balancer ip allocation method: Static / Dynamic "
  type        = string
  default     = "Static"
}
variable "lb_sku" {
  description = "The type of the Load Balancer"
  type        = string
  default     = "Standard"
}
variable "lb_frontend_ip_name" {
  description = "The Name of the Frontend IP for the Load Balancer"
  type        = string
}

variable "lb_backend_pool_name" {
  description = "The Name of the Backend Pool for the Load Balancer"
  type        = string
}

variable "lb_rule_name" {
  description = "The Name of the Backend Pool for the Load Balancer"
  type        = string
}

variable "lb_rule_protocol" {
  description = "The protocol of the rule for the Load Balancer"
  type        = string
  default = "tcp"
}

variable "lb_frontend_port" {
  description = "The frontend port Pool for the Load Balancer"
  type        = number
  default = 8080
}

variable "lb_backend_port" {
  description = "The backend port Pool for the Load Balancer"
  type        = number
  default = 8080
}

variable "lb_health_name" {
  description = "The Name of the Health Probe for the Load Balancer"
  type        = string
}

variable "lb_health_port" {
  description = "The Health Probe port for the Load Balancer"
  type        = number
  default = 8080
}

variable "lb_health_protocol" {
  description = "The protocol of the Health Probe for the Load Balancer"
  type        = string
  default = "tcp"
}

variable "tags" {
  type = map(string)
  default = {}
}





