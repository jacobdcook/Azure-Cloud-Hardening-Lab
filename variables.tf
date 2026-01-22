variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-hardening-lab-v2"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "southcentralus"
}

variable "authorized_ip" {
  description = "The public IP address authorized to access the VM via SSH/RDP (e.g., '1.2.3.4')"
  type        = string
  default     = "162.196.91.192"
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
  default     = "azureuser"
}
