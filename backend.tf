terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"

      version = "~> 3.0"
    }
  }
  required_version = ">= 0.13"
#  backend "s3" {
#    profile = "demo"
#    region  = "us-east-1"
#    key     = "terraform.tfstate"
#    bucket  = "<AWS-S3-BUCKET-NAME-GOES-HERE>"
#  }
}