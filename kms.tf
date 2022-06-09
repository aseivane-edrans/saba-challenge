data "aws_kms_key" "s3" {
  key_id = var.s3-kms.kms_key_id
}
/*
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terraform-state-prod"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}*/