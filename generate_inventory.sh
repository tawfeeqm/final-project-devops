#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define the directory containing your Terraform configuration
TERRAFORM_DIR="$SCRIPT_DIR/terraform"

# Define the directory where you want to place the inventory file
ANSIBLE_INVENTORY_DIR="$SCRIPT_DIR/ansible/group_vars"
ANSIBLE_INVENTORY_FILE="$ANSIBLE_INVENTORY_DIR/all.yml"

# Change to the Terraform directory
cd "$TERRAFORM_DIR" || { echo "Failed to change directory to $TERRAFORM_DIR"; exit 1; }

# Generate the Terraform output in JSON format
terraform output -json > terraform_output.json

# Extract the IP addresses using jq
monitoring_ip_address=$(jq -r '.monitoring_node_ips.value' terraform_output.json)
cicd_ip_address=$(jq -r '.cicd_node_ips.value' terraform_output.json)

# Ensure the inventory directory exists
mkdir -p "$ANSIBLE_INVENTORY_DIR"

# Use Python to update the YAML file
python3 - <<EOF
import yaml
import os

inventory_file = "$ANSIBLE_INVENTORY_FILE"
monitoring_ip_address = "$monitoring_ip_address"
cicd_ip_address = "$cicd_ip_address"
monitoring_user = "ubuntu"
cicd_user = "ubuntu"

# Read the existing YAML file if it exists
if os.path.exists(inventory_file):
    with open(inventory_file, 'r') as file:
        content = yaml.safe_load(file) or {}
else:
    content = {}

# Update the IP addresses
content['monitoring_ip_address'] = monitoring_ip_address
content['cicd_ip_address'] = cicd_ip_address
content['monitoring_user'] = monitoring_user
content['cicd_user'] = cicd_user

# Write the updated content back to the YAML file
with open(inventory_file, 'w') as file:
    yaml.safe_dump(content, file, default_flow_style=False)
EOF

