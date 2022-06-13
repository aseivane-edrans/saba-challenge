
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
  policy       = var.vpc_endpoint_s3_policy
  route_table_ids = concat(
    aws_route_table.private.*.id,
    aws_default_route_table.public.*.id,
  )
  tags = merge(var.tags,
  tomap({ "Name" = "${var.tags["prefix"]}-s3-vpc-endpoint" }))
}

resource "aws_vpc_endpoint" "dynamodb" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.dynamodb"
  policy       = var.vpc_endpoint_dynamodb_policy
  route_table_ids = concat(
    aws_route_table.private.*.id,
    aws_default_route_table.public.*.id,
  )
  tags = merge(var.tags,
  tomap({ "Name" = "${var.tags["prefix"]}-dynamodb-vpc-endpoint" }))
}

resource "aws_vpc_endpoint" "ecr_api" {
  count               = var.vpc_endpoint_ecr_enabled ? 1 : 0
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${data.aws_region.current.name}.ecr.api"
  private_dns_enabled = true # this needs to be true for this VPC endpoint
  auto_accept         = true
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [coalescelist(var.vpc_endpoint_ecr_security_group_ids, aws_security_group.ecr_vpc_endpoint.*.id)]
  subnet_ids          = [coalescelist(var.vpc_endpoint_ecr_subnet_ids, aws_subnet.private.*.id)]
  tags = merge(var.tags,
  tomap({ "Name" = "${var.tags["prefix"]}-ecr-dkr-vpc-endpoint" }))
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  count               = var.vpc_endpoint_ecr_enabled ? 1 : 0
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${data.aws_region.current.name}.ecr.dkr"
  private_dns_enabled = true
  auto_accept         = true
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [coalescelist(var.vpc_endpoint_ecr_security_group_ids, aws_security_group.ecr_vpc_endpoint.*.id)]
  subnet_ids          = [coalescelist(var.vpc_endpoint_ecr_subnet_ids, aws_subnet.private.*.id)]
  tags = merge(var.tags,
  tomap({ "Name" = "${var.tags["prefix"]}-ecr-dkr-vpc-endpoint" }))
}

resource "aws_security_group" "ecr_vpc_endpoint" {
  count       = var.vpc_endpoint_ecr_enabled && length(var.vpc_endpoint_ecr_security_group_ids) == 0 ? 1 : 0
  name        = "${var.tags["prefix"]}-ecr-vpc-endpoint"
  description = "SG for ECR VPC Endpoint"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [coalescelist(var.vpc_endpoint_ecr_security_group_cidr_blocks, aws_subnet.private.*.cidr_block)]
  }

  tags = merge(var.tags,
  tomap({ "Name" = "${var.tags["prefix"]}-ecr-vpc-endpoint-sg" }))
}
