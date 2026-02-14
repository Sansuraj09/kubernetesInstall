#!/bin/bash
# Master Node Initialization Script

echo "--- Pulling Kubernetes images ---"
sudo kubeadm config images pull

echo "--- Initializing Cluster ---"
# We run init. Note: Weave usually works without a specific CIDR, 
# but we'll stick to your provided command.
sudo kubeadm init

echo "--- Setting up kubeconfig for $(whoami) ---"
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "--- Installing Weave CNI ---"
kubectl apply -f https://reweave.azurewebsites.net/k8s/v1.30/net.yaml

echo "-----------------------------------------------------------"
echo "MASTER INITIALIZATION COMPLETE"
echo "Look at the output above and COPY the 'kubeadm join' command."
echo "You will need the IP, Token, and Hash for the worker nodes."
echo "-----------------------------------------------------------"
