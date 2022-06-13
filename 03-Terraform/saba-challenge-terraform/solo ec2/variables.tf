# This variables are shared across environments and its values should
# be updated on the variables file of each environment.
# ie: environments/${env}/${environment}.auto.tfvars

# Other tags than the mandatory ones provided by the definition of
# the module `tf-null-label` should be defined here.
# You should always use `module.default_label.tags` for a curated
# list of tags.

variable "asg_tag_names" {
  description = "This is a workaround to be able to dynamically define the tags to the ASG. The value for each tag (from 0 to 9) should match a key in the *tags* variable."
  type        = map(string)
  default = {
    tag_0 = "environment"
    tag_1 = "owner"
    tag_2 = "costCenter"
    tag_3 = "role"
    tag_4 = "project"
  }
}

variable "office_ips" {
  description = "List of IP addresses allowed to access to restricted resources"
  default = [
    "201.216.207.125/32", # Edrans BA Office
  ]
}

variable "env" {
  description = "Map containing all the environment configuration"
  type        = map(string)
  default = {
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