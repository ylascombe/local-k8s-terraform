
module "argo-cd" {
  source = "../../modules/argocd"

  argocd_admin_password = "pleasechangeme"
}
