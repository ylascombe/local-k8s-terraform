
# Prerequisites

* kind
* terraform >= v1.0.5
* Generate specific certificate

```sh
cd helm/cert-manager/templates/
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout tls.key -out tls.crt -subj "/CN=k8s.local"
kubectl create secret tls cert-manager-ca -n cert-manager --key="tls.key" --cert="tls.crt" --dry-run=client -oyaml > secret.yaml
```

# Launch


```sh
cd terraform/01-provision
terraform init
terraform apply
# kind cluster should be deployed

cd ../02-gitops-tool
terraform init
terraform apply
# argocd should be deployed in k8s cluster

cd ../03-k8s-system-tools
terraform init
terraform apply
# argocd resources deployed to deploy cert-manager and ingress controller (kong or nginx)

```
