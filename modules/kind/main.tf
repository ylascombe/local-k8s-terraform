resource "kind_cluster" "local" {
  name            = "demo"
  wait_for_ready  = true
  node_image      = "kindest/node:v1.22.5"
  kubeconfig_path = "../../kube_config.yaml"

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    node {
      role = "control-plane"
      extra_port_mappings {
        container_port = 80
        host_port      = 8080
        listen_address = "0.0.0.0"
        protocol       = "TCP"
      }

      extra_port_mappings {
        container_port = 443
        host_port      = 8443
        listen_address = "0.0.0.0"
        protocol       = "TCP"
      }

      kubeadm_config_patches = [
        <<-EOT
kind: InitConfiguration
nodeRegistration:
  kubeletExtraArgs:
    node-labels: ingress-ready=true
EOT
      ]
    }
  }
}

output "kubeconfig" {
  value = kind_cluster.local.kubeconfig
}