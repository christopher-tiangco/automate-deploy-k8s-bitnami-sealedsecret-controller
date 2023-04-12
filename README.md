# Deploying Bitnami SealedSecrets Controller to Kubernetes cluster via ArgoCD and Terraform

Terraform configuration for deploying Bitnami SealedSecrets controller into Kubernetes cluster via ArgoCD.

Manually installing Bitnami SealedSecrets controller using ArgoCD is really straightforward. However, the goal of putting it as a Terraform configuration is to automate its installation using GitOps methodology (via ArgoCD)

The Terraform configuration interacts with ArgoCD's REST API to create and deploy the Sealedsecrets controller as an ArgoCD application

For more info about Bitnami SealedSecrets controller, see https://github.com/bitnami-labs/sealed-secrets#overview

## Prerequisites
- Terraform CLI
- ArgoCD on Kubernetes cluster - most importantly, access to its REST API (see https://github.com/christopher-tiangco/automate-deploy-k8s-argocd for provisioning configuration)
- Git repository that hosts the SealedSecrets controller manifest (`controller.yaml`)

## Important
- This configuration was verified to work with Bitnami SealedSecrets controller `v0.19.3` deployed on ArgoCD and running on a k3s cluster provisioned via https://github.com/christopher-tiangco/automate-k8s-cluster
- Make sure to add an `inputs.tfvars` file (which is set to be ignored by the repository) for setting the server target. Below is the format:
```
argo_cd = {
  host      = "Argo CD URL (e.g https://argocd.example.com)"
  user      = "Argo CD admin username"
  password  = "Argo CD admin password"
}
```

- To run the configuration, simply do the following commands
```
terraform init
terraform apply -var-file="inputs.tfvars"
```