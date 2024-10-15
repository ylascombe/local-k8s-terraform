

resource "helm_release" "argocd_system" {
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.19.12"
  timeout    = 3000

  create_namespace = true
  namespace        = "argocd-system"

  values = [
    templatefile("${path.module}/helm_values.tmpl", {argocd_admin_password = var.argocd_admin_password} )
  ]
}

