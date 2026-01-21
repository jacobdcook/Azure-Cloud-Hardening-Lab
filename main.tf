# Azure Cloud Hardening Lab - Main Configuration

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "hardening_lab" {
  name     = "rg-hardening-lab-sacramento"
  location = "West US"
}

# --- TODO for Tomorrow ---
# 1. Create a Virtual Network (VNet)
# 2. Create a Network Security Group (NSG) with strict rules
# 3. Create a Virtual Machine with disk encryption enabled
# -------------------------
