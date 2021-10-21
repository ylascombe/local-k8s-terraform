
locals {
  apps = split("\n---\n", data.template_file.kong_yaml.rendered)
}

resource "kubernetes_manifest" "kong_test_app" {
  count = length(local.apps)
  manifest   = yamldecode(local.apps[count.index])
}