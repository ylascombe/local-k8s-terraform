variable "apps_infra_git_url" {
  description = "Git infrastructure apps repository URL"
  default     = "https://github.com/ylascombe/local-k8s-terraform"
}

variable "ingress_controller_type" {
  description = "Ingress controller type between nginx and kong"
}

variable "cluster_name" {
  type = string
}
