#!/bin/bash
docker build -t kpericak/kubelet .

echo "kubeconfig_path="
echo "docker run -v \$kubeconfig_path:/root/.kube/config -d --name kubelet kpericak/kubelet"
