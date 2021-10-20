
module "k8s-cert-manager-ingress-controller" {
  source = "../../modules/k8s-cert-manager-ingress-controller"

  apps_infra_git_url = var.apps_infra_git_url
  ingress_controller_type = var.ingress_controller_type
}
