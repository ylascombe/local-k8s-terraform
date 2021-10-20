
provider kubernetes {
  config_path    =  "../../kube_config.yaml"
  config_context = "kind-demo"
  experiments {
    manifest_resource = true
  }
}

provider helm {
  kubernetes {
    config_path    = "../../kube_config.yaml"
    config_context = "kind-demo"
  }
}
