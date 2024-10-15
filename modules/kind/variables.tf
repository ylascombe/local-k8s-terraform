variable "node_image" {
  type = string
  description = "(Optional) The node_image that kind will use."
  default = "kindest/node:v1.31.0"
}