data "template_file" "argocd_values" {
  template = file("${path.module}/helm_values.tmpl")
  vars = {
    argocd_admin_password = var.argocd_admin_password
  }
}