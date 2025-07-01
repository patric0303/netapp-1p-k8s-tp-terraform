#!/bin/bash
set -euo pipefail


install_trident_protect() {
        echo "    --> adding Trident protect Helm repository"
	      helm repo add netapp-trident-protect https://netapp.github.io/trident-protect-helm-chart
        # echo "    --> installing Trident protect CRDs via Helm"
        # Not needed anymore in v25.06
        # helm install trident-protect-crds netapp-trident-protect/trident-protect-crds --version ${gke_trident_protect_version} --create-namespace --namespace trident-protect
        echo "    --> installing Trident protect via Helm"
	      helm install trident-protect netapp-trident-protect/trident-protect --set clusterName=${gke_cluster_name} --version ${gke_trident_protect_version} --create-namespace --namespace trident-protect
}

###########################
# Install Trident protect #
###########################
echo "--> determining if Trident protect needs to installed"
set +e
kubectl get ns trident-protect >> /dev/null 2>&1
NS_EXISTS=$?
set -e
if [[ $NS_EXISTS -eq 0 ]]; then
        echo "    --> Trident protect namespace already exists, skipping installation"
else
	install_trident_protect
        echo "--> sleeping for 1 minute for Trident protect pods to start up"
        sleep 60
fi