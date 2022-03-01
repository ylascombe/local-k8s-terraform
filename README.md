
# Prerequisites

* kind
* terraform >= v1.0.5
* Generate specific certificate with following commands:

```sh
cd helm/cert-manager/templates/
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout tls.key -out tls.crt -subj "/CN=k8s.local"
kubectl create secret tls cert-manager-ca -n cert-manager --key="tls.key" --cert="tls.crt" --dry-run=client -oyaml > secret.yaml
```

# Launch local cluster with Terraform


```sh
cd terraform/01-provision
terraform init
terraform apply
# kind cluster should be deployed

kind export kubeconfig --name demo

cd ../02-gitops-tool
terraform init
terraform apply
# argocd should be deployed in k8s cluster

cd ../03-k8s-system-tools
terraform init
terraform apply
# argocd resources deployed to deploy cert-manager and ingress controller (kong or nginx)

```

## Access to ArgoCD

```sh
kubectl port-forward svc/argo-cd-argocd-server -n argocd-system 8082:80
```


# TODO

* [ ] Generate certificate dynamically and add it to local browser trustore
* [ ] Configure local registry to test really locally


# FAQ

Please see [associated page](./docs/faq.md)

