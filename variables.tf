variable "external_port" {
  type    = number
  default = 8080
  validation {
    condition     = can(regex("8080|80", var.external_port))
    error_message = "Port values can only be 8080 or 80."
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
    project        = "SOT2022Q1-terraform-sabachallenge"
  }
}