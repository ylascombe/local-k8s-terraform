
provider "kubernetes" {
  config_path    = "../../kube_config.yaml"
  config_context = "kind-demo"
}

