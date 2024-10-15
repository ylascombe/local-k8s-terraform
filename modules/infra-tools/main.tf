
locals {
  apps = split("\n---\n", templatefile("${path.module}/apps.tmpl",{
    apps_infra_git_url      = var.apps_infra_git_url
    ingress_controller_type = var.ingress_controller_type

    cluster_name = var.cluster_name
  })) 
}

resource "kubernetes_manifest" "argocd_apps" {
  count    = length(local.apps)
  manifest = yamldecode(local.apps[count.index])

  field_manager {
    # set the name of the field manager
    name = "terraform"

    # force field manager conflicts to be overridden
    force_conflicts = true
  }
}
