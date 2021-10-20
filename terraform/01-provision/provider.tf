terraform {
  required_providers {
    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.9"
    }
  }
}

provider "kind" {
  # Configuration options
}
