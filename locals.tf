locals {
  name_prefix = "${var.project.name}-${var.project.user}"
  r53_internal_zone = "${var.project.user}.internal"
}
