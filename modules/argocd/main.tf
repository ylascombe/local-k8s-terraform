

resource "helm_release" "argocd_system" {
  depends_on = []
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "3.34.0"
  timeout    = 3000

  create_namespace = true
  namespace        = "argocd-system"

  values = [
    data.template_file.argocd_values.rendered
  ]

}
