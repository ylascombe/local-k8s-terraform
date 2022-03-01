
locals {
  apps = split("\n---\n", data.template_file.apps_infra_yaml.rendered)
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