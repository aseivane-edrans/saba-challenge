# Route53 Main Internal Zone
resource "aws_route53_zone" "main" {
  comment = "Internal hosted zone for ${var.project.user}"
  name    = "${var.project.user}.internal"
}
