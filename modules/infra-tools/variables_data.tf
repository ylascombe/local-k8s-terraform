data "template_file" "apps_infra_yaml" {
  template = file("${path.module}/apps.tmpl")
  vars = {
    apps_infra_git_url      = var.apps_infra_git_url
    ingress_controller_type = var.ingress_controller_type

    cluster_name = var.cluster_name
  }
}