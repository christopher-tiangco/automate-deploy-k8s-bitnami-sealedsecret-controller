# Deploying Bitnami SealedSecrets Controller to Kubernetes cluster via ArgoCD and Terraform

Terraform configuration for deploying Bitnami SealedSecrets controller and `kubeseal` binary into Kubernetes cluster via ArgoCD.

For more info about Bitnami SealedSecrets controller, see https://github.com/bitnami-labs/sealed-secrets#overview

## Prerequisites
- Terraform CLI
- ArgoCD on Kubernetes cluster - most importantly, access to its REST API (see https://github.com/christopher-tiangco/automate-deploy-k8s-argocd)
- The host that's running the Terraform CLI can SSH to the master node without using a password