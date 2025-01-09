#!/bin/bash
set -euo pipefail


install_trident_protect() {
        echo "    --> adding Trident protect Helm repository"
	helm repo add netapp-trident-protect https://netapp.github.io/trident-protect-helm-chart
        echo "    --> installing Trident protect CRDs via Helm"
        helm install trident-protect-crds netapp-trident-protect/trident-protect-crds --version ${aws_trident_protect_version} --create-namespace --namespace trident-protect
        echo "    --> installing Trident protect via Helm"
	helm install trident-protect netapp-trident-protect/trident-protect --set clusterName=${eks_cluster_name} --version ${aws_trident_protect_version} --create-namespace --namespace trident-protect
}

create_appvault_cr() {
        echo "    --> creating appVault secret"
        kubectl -n trident-protect create secret generic ${aws_s3_bucket} --from-literal=accessKeyID=${s3_access_key_id} --from-literal=secretAccessKey=${s3_secret_access_key}
        echo "    --> creating appVault CR"
        kubectl apply -f - <<EOF
apiVersion: protect.trident.netapp.io/v1
kind: AppVault
metadata:
  name: ${aws_s3_bucket}
  namespace: trident-protect
spec:
  providerConfig:
    s3:
      bucketName: ${aws_s3_bucket}
      endpoint: s3.example.com
  providerCredentials:
    accessKeyID:
      valueFromSecret:
        key: accessKeyID
        name: ${aws_s3_bucket}
    secretAccessKey:
      valueFromSecret:
        key: secretAccessKey
        name: ${aws_s3_bucket}
  providerType: AWS
EOF
}

##################
# Get Kubeconfig #
##################
#echo "--> getting cluster kubeconfig via az"
#az aks get-credentials --resource-group ${aks_rg_name} --name ${aks_cluster_name} --overwrite-existing

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

###########################
# Create appVault CR      #
###########################
# create_appvault_cr
