
module "kind" {
  source = "../../modules/kind"
}

output "kubeconfig" {
  value = module.kind.kubeconfig
}