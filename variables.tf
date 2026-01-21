variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-hardening-lab"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "West US"
}

variable "authorized_ip" {
  description = "The public IP address authorized to access the VM via SSH/RDP (e.g., '1.2.3.4')"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
  default     = "azureuser"
}
