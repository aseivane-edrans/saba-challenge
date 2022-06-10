terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"

      version = "~> 4.18.0"
    }
  }
  required_version = ">= 0.13"/*
  backend "s3" {
    bucket        = "terraform-onboarding-aseivane-tfstate"
    key           = "terraform.tfstate"
    region        = "us-east-1"
    encrypt       = true
    kms_key_id    = "alias/aws/s3"
  }*/
}