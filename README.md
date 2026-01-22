# Azure Cloud Hardening Lab (IaC)

This project demonstrates **Infrastructure as Code (IaC)** best practices for deploying secure cloud environments. I used **Terraform** to provision a hardened Azure network stack that follows the Principle of Least Privilege.

## Objective
- Build a secure Azure landing zone using Terraform.
- Restrict all inbound access to a single authorized public IP.
- Use managed identity and encrypted storage by default.
- Document evidence for a portfolio-ready deliverable.

## Architecture
**Resource Group:** `rg-hardening-lab-v2`  
**Region:** `southcentralus`  
**Resources:**
- Virtual Network: `vnet-hardening-lab` (10.0.0.0/16)
- Subnet: `snet-internal` (10.0.1.0/24)
- Network Security Group: `nsg-hardening-lab`
- Public IP: `pip-hardening-lab`
- Network Interface: `nic-hardening-lab`

## Security Controls Implemented
- **NSG Inbound Rules:** Only SSH (22) and RDP (3389) from `authorized_ip`.
- **Deny-All Inbound:** Explicit deny rule for every other inbound connection.
- **Least Privilege:** No open inbound ports beyond the single approved IP.
- **Managed Identity:** System-assigned identity enabled for VM access (no hardcoded credentials).
- **Disk Encryption:** Managed disk encryption at rest (Azure default for managed disks).

## 🔒 Security Focus

- **Network Security Groups (NSG):** Only allows SSH/RDP traffic from a single authorized IP address.
- **Data Encryption:** All storage accounts and managed disks are configured with AES-256 encryption at rest.
- **Identity Management:** Managed Identities used for resource access (no hardcoded credentials).
- **Public IP Management:** Minimized public exposure by only assigning IPs where absolutely necessary.

## 🛠️ Technologies
- **Azure** (Cloud Provider)
- **Terraform** (Infrastructure as Code)
- **HCL** (HashiCorp Configuration Language)

## Infrastructure Overview
1. **Virtual Network (VNet):** Isolated network segment.
2. **Subnet:** Secured with a strict Network Security Group.
3. **Virtual Machine:** Hardened Ubuntu instance.
4. **Encryption:** Managed Disk encryption enabled by default.

## How to Deploy
1. Install Terraform.
2. Authenticate with Azure CLI (`az login`).
3. Update `authorized_ip` in `variables.tf`.
4. Run `terraform init` and `terraform apply`.

## Notes on Azure Capacity
Azure capacity for low-cost VM sizes can be limited by region. If VM creation fails with `SkuNotAvailable`, the network hardening portion still deploys successfully and is fully documented below. This lab focuses on secure network design and least-privilege access, which are the core hardening objectives.

## Evidence (Screenshots)
All screenshots are stored in the `screenshots/` folder.

**1) Terraform plan (proposed resources)**  
Shows the intended infrastructure and security controls before deployment.
![Terraform plan](https://raw.githubusercontent.com/jacobdcook/Azure-Cloud-Hardening-Lab/main/screenshots/01-terraform-plan.png)

**2) Hardened infrastructure overview (resource group)**  
Proof of deployed resources in Azure after apply.
![Resource group overview](https://raw.githubusercontent.com/jacobdcook/Azure-Cloud-Hardening-Lab/main/screenshots/01-hardened-infrastructure-overview.png)

**3) NSG inbound rules (restricted to authorized IP)**  
Shows least-privilege rules plus deny-all inbound.
![NSG rules](https://raw.githubusercontent.com/jacobdcook/Azure-Cloud-Hardening-Lab/main/screenshots/02-hardened-nsg-rules.png)

**4) Subnet association with NSG**  
Confirms the subnet is protected by the NSG.
![Subnet association](https://raw.githubusercontent.com/jacobdcook/Azure-Cloud-Hardening-Lab/main/screenshots/03-subnet-security-association.png)

## Lessons Learned
- Azure capacity constraints can block specific VM sizes by region.
- Network hardening can be validated independently of VM creation.
- Terraform state management is critical when retries and manual cleanup are required.

## Cleanup
When finished, remove all resources to avoid charges:
```bash
az group delete --name rg-hardening-lab-v2 --yes --no-wait
```

---
*This lab is one of my top portfolio projects focused on Cloud Security and Automation.*
