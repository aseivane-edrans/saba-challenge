# Migrations

## From 4.x to 5.x

Version 5.x changes variable `vpc_dns_server` type from `string` to `list` to support multiple DNS servers.
In version 4.x, this prevents from adding multiple DNS servers in DHCP options. The major upgrade is preferred to using a `split` in a `string` since `list` is the type of variable used in the terraform resource.

## From 3.x to 4.x

Version 3.x had an assumption that we'd never have more than 10 public subnets,
as the `count.index` attribute had a hardcoded `10 +` increment to make sure it didn't overlap
with the private subnets.
In version 4.x, this `10 +` increment is replaced by the length of the `azs_list` variable,
under the more accurate assumption that there will be only one public and one private subnet
per AZ.
This migration requires Cronus setup recreation as terraform fails to destroy all the resources 
and recreate them.

## From 2.x to 3.x

Version 2.x relies on the resource `aws_availability_zones` to get the
list of AZs and depends on the variable `azs_count`. In version 3.x that
resource was removed and so the variable `azs_count`.
To be able to set the AZs list there is a new variable `azs_list`.

### Define AZ list manualy

Take into account that you will need to setup a variable with the AZ for every region you want to deploy the infrastructure.

```
variable "azs_list" {
  default = [ "us-east-1a", "us-east-1b", "us-east-1c"]
}

module "vpc" {
  source        = "../modules/tf-aws-vpc-with-dhcp-options"

  cidr_block    = "10.100.0.0/16"
  azs_list      = "${var.azs_list}"
  vpc_zone_name = "myzone.internal"

  tags = "${var.tags}"
}
```

### Keeping old behaviour

Actually there is not way of keeping the old behaviour as Terraform does
not allow using non-computed resources in count varaiables.
There is an open issue for this: https://github.com/hashicorp/terraform/pull/11482
