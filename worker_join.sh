#!/bin/bash
# Worker Node Join Script

echo "--- Kubernetes Worker Join Tool ---"

# Prompting for user input
read -p "Enter the Master Node IP (e.g., 192.168.1.10): " MASTER_IP
read -p "Enter the Token (e.g., abcdef.1234567890abcdef): " JOIN_TOKEN
read -p "Enter the Discovery Hash (the long sha256:...): " DISCOVERY_HASH

echo "--- Attempting to join the cluster ---"

sudo kubeadm join ${MASTER_IP}:6443 \
    --token ${JOIN_TOKEN} \
    --discovery-token-ca-cert-hash ${DISCOVERY_HASH}

echo "--- Join process complete. Check status on the Master node with 'kubectl get nodes' ---"
