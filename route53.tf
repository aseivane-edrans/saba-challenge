# Route53 Main Internal Zone
resource "aws_route53_zone" "internal" {
  comment = "Internal hosted zone for ${local.user}"
  name    = "${local.user}.internal"

  vpc {
    vpc_id = aws_vpc.vpc.id
  }
}
