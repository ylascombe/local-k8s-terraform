data "template_file" "kong_yaml" {
  template = file("${path.module}/apps.tmpl")
  vars = {}
}