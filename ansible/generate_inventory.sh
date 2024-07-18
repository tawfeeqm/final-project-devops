#!/bin/bash

terraform output -json > terraform_output.json

monitoring_ip_address=$(jq -r '.monitoring_node_ips.value[0]' terraform_output.json)
cicd_ip_address=$(jq -r '.cicd_node_ips.value[0]' terraform_output.json)

cat <<EOF > inventory/group_vars/all.yml
monitoring_ip_address: $monitoring_ip_address
cicd_ip_address: $cicd_ip_address
EOF
