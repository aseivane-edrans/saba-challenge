variable "project" {
  description = "Project varibales"
  type        = map(string)
  default = {
    name    = "cloudOnboarding"
    user    = "aseivane"
    region  = "us-east-1"
  }  
}

variable "tags" {
  description = "Map containing all the mandatory tags"
  type        = map(string)
  default = {
    environment    = "trainning"
    owner          = "aseivane@edrans.com"
    costCenter     = "SiteOps"
    tagVersion     = 1
    role           = "SOT"
    region         = "us-east-1"
    project        = "cloudOnboarding"
  }
}

variable "s3-kms" {
  description = "S3 KMS keys and parameters"
  type        = map(string)
  default = {
    bucket        = "terraform-onboarding-aseivane-tfstate"
    key           = "terraform.tfstate"
    region        = "us-east-1"
    kms_key_id    = "alias/aws/s3"
  }
}

variable "external_port" {
  type    = number
  default = 8080
  validation {
    condition     = can(regex("8080|80", var.external_port))
    error_message = "Port values can only be 8080 or 80."
  }
}