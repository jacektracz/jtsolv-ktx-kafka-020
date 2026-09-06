#!/bin/bash
set -e

echo "🔍 Detecting node IP..."
NODE_IP=$(hostname -I | awk '{print $1}')

echo "✅ Node IP detected: $NODE_IP"

echo "🔄 Refreshing MicroK8s certs with SANs: 127.0.0.1, localhost, $NODE_IP"
sudo microk8s refresh-certs --cert server.crt --cert server.key --extra-sans "127.0.0.1,localhost,$NODE_IP"
# sudo microk8s refresh-certs --cert server.crt --cert server.key --extra-sans "127.0.0.1,localhost,192.168.55.103"
echo "🔁 Restarting MicroK8s..."
sudo microk8s stop
sudo microk8s start

echo "🎉 Done!"
echo "👉 You can now access the dashboard at:"
echo "   https://127.0.0.1:10443"
echo "   https://$NODE_IP:10443"



sudo microk8s stop
sudo microk8s refresh-certs --cert server.crt --cert server.key
sudo microk8s start
