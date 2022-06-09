variable "vpc" {
  default = {
    "cidr_block" = "10.0.0.0/16"
    "newbits"    = "8"
  }
}

variable "vpc_azs_list" {
  default = [
    "us-east-1d",
    "us-east-1e"
  ]
}

module "vpc" {
  source = "./tf-aws-vpc-with-dhcp-options"

  cidr_block = "${var.vpc["cidr_block"]}"
  newbits    = "${var.vpc["newbits"]}"
  azs_list   = "${var.vpc_azs_list}"

  vpc_zone_name = aws_route53_zone.internal.name

  tags = {
    prefix = "${var.tags["prefix"]}"
  }
}

#Create SG for allowing TCP/80 & TCP/22
resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow TCP/80 & TCP/22"
  vpc_id      = module.vpc.vpc_id
  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow traffic from TCP/80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



/*
#Create VPC in us-east-1
resource "aws_vpc" "vpc-private" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${local.name_prefix}-vpc-private"
  }

}

#Create IGW in us-east-1
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-private.id
}

#Get main route table to modify
data "aws_route_table" "main_route_table" {
  filter {
    name   = "association.main"
    values = ["true"]
  }
  filter {
    name   = "vpc-id"
    values = [aws_vpc.vpc-private.id]
  }
}

#Create route table in us-east-1
resource "aws_default_route_table" "internet_route" {
  default_route_table_id = data.aws_route_table.main_route_table.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${local.name_prefix}-RouteTable"
  }
}

#Get all available AZ's in VPC for master region
data "aws_availability_zones" "azs" {
  state = "available"
}

#Create subnet # 1 in us-east-1
resource "aws_subnet" "subnet" {
  availability_zone = element(data.aws_availability_zones.azs.names, 0)
  vpc_id            = aws_vpc.vpc-private.id
  cidr_block        = "10.0.1.0/24"
}


*/