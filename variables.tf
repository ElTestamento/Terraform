variable "azure_rg_name" {
  type        = string
  description = "The Azure RG is Name"
  default     = "TOP-prod-rg"
}

variable "azure_location" {
  type        = string
  description = "The Azure Region"
  default     = "West Europe"

}
variable "virtual_network_name" {
  default     = "TOPprodvnet"
  description = "Name of Virtual NetV"
}
variable "virtual_subnet_name" {
  default     = "TOPprodsubnet"
  description = "Name of virtual Subnet"
}

variable "public_IP" {
  default     = "TOP2024"
  description = "Name of pIP"
}
variable "network_security_group_name" {
  default     = "TOPprodnsg"
  description = "Name der NSG"
}
