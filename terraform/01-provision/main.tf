
module "k8s_cluster" {
  source = "../../modules/kind"
}

output "kubeconfig" {
  value = module.k8s_cluster.kubeconfig
}
