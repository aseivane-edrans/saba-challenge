terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.env["region"]
}

resource "aws_instance" "app_server" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"

  tags = {
    name           = "sot2022Q1-saba-challenge-us-east-1"
    prefix         = " "
    region         = "us-east-1"
    key_name       = "default"
    project        = "sot2022Q1-saba-challenge-terraform"
    costCenter     = "SiteOps"
    owner          = "aseivane@edrans.com"
    tagVersion     = 1
  }
}