variable "azs_list" {
  description = "List of Availability Zones (provides a way to specify the AZ where subnets will be created)."
  default     = []
}

variable "cidr_block" {
  description = "CIDR block that the VPC should cover"
}

variable "newbits" {
  description = "Number of bits that the CIDR should be extended with when creating subnets"
  default     = 8
}

variable "enable_dns_support" {
  description = "Should DNS resolution be supported for the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Should instances launched inside the VPC be assigned DNS names"
  default     = true
}

variable "vpc_zone_name" {
  description = "The suffix domain name to use by default when resolving non Fully Qualified Domain Names"
  default     = ""
}

variable "vpc_dns_server" {
  description = "DNS Servers for the VPC"
  default     = ["AmazonProvidedDNS"]
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
}

variable "vpc_additional_tags" {
  description = "A mapping of tags to be merged with the tags variable specific for the vpc"
  type        = map(string)
  default     = {}
}

variable "private_subnet_additional_tags" {
  description = "A mapping of tags to be merged with the tags variable specific for the private subnets"
  type        = map(string)
  default     = {}
}

variable "public_subnet_additional_tags" {
  description = "A mapping of tags to be merged with the tags variable specific for the public subnets"
  type        = map(string)
  default     = {}
}

variable "enable_nat_gateways" {
  description = "Provision nat gateways"
  default     = true
}

variable "vpc_endpoint_s3_policy" {
  description = "A policy to attach to the endpoint that controls access to the S3 service"
  default     = ""
}

variable "vpc_endpoint_dynamodb_policy" {
  description = "A policy to attach to the endpoint that controls access to the DynamoDB service"
  default     = ""
}

variable "vpc_endpoint_ecr_enabled" {
  description = "Should the ECR VPC endpoint be created or not"
  type        = bool
  default     = false
}

variable "vpc_endpoint_ecr_security_group_ids" {
  description = "A list of security group IDs to add to the ECR VPC endpoint. If not set and ECR VPC endpoint is enabled, a default security group allowing all private subnets in the module will be added."
  type        = list(string)
  default     = []
}

variable "vpc_endpoint_ecr_subnet_ids" {
  description = "A list of subnet IDs to add to the ECR VPC endpoint. If not set and ECR VPC endpoint is enabled, private subnets defined in the module will be added."
  type        = list(string)
  default     = []
}

variable "vpc_endpoint_ecr_security_group_cidr_blocks" {
  description = "A list of subnet CIDR blocks to add to the ECR VPC endpoint security group. If not set and ECR VPC endpoint is enabled, private subnets CIDR blocks defined in the module will be added."
  type        = list(string)
  default     = []
}

variable "route_propagation" {
  description = "A list of virtual gateways for propagation"
  default     = []
}

