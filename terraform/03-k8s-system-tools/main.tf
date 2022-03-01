module "system-tools" {
  source = "../../modules/infra-tools"

  apps_infra_git_url      = var.apps_infra_git_url
  ingress_controller_type = var.ingress_controller_type
  cluster_name            = "dev"
}
