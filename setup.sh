#!/bin/bash

# SOC Monitoring Lab Setup Script
echo "Starting Blue Team SOC Monitoring Lab Setup..."

# 1. Update system and install dependencies
sudo apt-get update
sudo apt-get install -y docker.io docker-compose python3-pip

# 2. Configure Wazuh Agent (Simulated steps)
echo "Installing Wazuh Agent..."
# wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.7.2-1_amd64.deb
# sudo WAZUH_MANAGER='127.0.0.1' dpkg -i wazuh-agent_4.7.2-1_amd64.deb

# 3. Ensure auth.log is readable
sudo touch /var/log/auth.log
sudo chmod 644 /var/log/auth.log

echo "Setup complete. Run 'docker-compose up -d' to start the SIEM stack."
