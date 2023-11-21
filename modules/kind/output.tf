output "kubeconfig" {
    description = "The kubeconfig for the cluster after it is created"
    value = kind_cluster.local.kubeconfig
}