# Route53 Main Internal Zone
resource "aws_route53_zone" "internal" {
  comment = "Internal hosted zone for ${var.project.user}"
  name    = "${var.project.user}.internal"

  vpc {
    vpc_id = module.vpc.vpc_id
  }
}
