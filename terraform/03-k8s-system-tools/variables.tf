variable "apps_infra_git_url" {
  description = "Git infrastructure apps repository URL that host customized helm charts"
  default     = "git remote add origin git@github.com:ylascombe/local-k8s-terraform.git"
}

variable "ingress_controller_type" {
  description = "Ingress controller type between nginx and kong"
  default     = "nginx"
}
