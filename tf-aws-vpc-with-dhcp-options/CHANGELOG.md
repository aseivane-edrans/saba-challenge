## 8.0.0 (September 13, 2021)

IMPROVEMENTS:

* Replaced function map() with function tomap() to handle input variables properly . map() Function deprecated on Terraform 0.12.x and no longer available on Terraform >= 0.15.x
* Upgrade to Terraform 0.15.x

## 7.2.0 (abril 28, 2021)

FEATURE:

* Added image tag to CI/CD pipeline file.

## 7.1.0 (December 10, 2019)

FEATURE:

* Added Bitbucket CI/CD pipeline file.

## 7.0.0 (December 05, 2019)

BACKWARDS INCOMPATIBILITIES / NOTES:

* Fixed list outputs bugs that were introduced in the 0.12 version bump, which returned "nested" lists instead of single ones.

## 6.1.1 (October 23, 2019)

BUGFIX:

* Fixed some interpolations to use proper Terraform 0.12 syntax 

## 6.1.0 (October 22, 2019)

FEATURES:

* Added ECR VPC endpoint. Not enabled by default.

## 6.0.0 (June 13, 2019)

IMPROVEMENTS:

* Upgrade to Terraform 0.12.x

## 5.3.0 (February 13, 2019)

IMPROVEMENTS:

* Specific Tags for vpc, private and public subnets can be added to differentiate them. These will be merged with the tags defined in the `tag` variable.

## 5.2.0 (February 6, 2019)

Bugfix:

* Fix Tags merging order, so the Name tag gets set correctly.

## 5.1.0 (January 4, 2019)

IMPROVEMENTS:

* Update value for `aws_region.current` variable to avoid the deprecation warning:
  `[DEPRECATED] Defaults to current provider region if no other filtering is enabled`
  You must use the aws provider >= 1.9

## 5.0.1 (November 27, 2018)

IMPROVEMENTS:

 * Add route propagation to the default public route

## 5.0.0 (April 17, 2018)

BACKWARDS INCOMPATIBILITIES / NOTES:

 * Change variable `vpc_dns_server` type from `string` to `list` to support multiple DNS servers.

## 4.2.0 (January 25, 2018)

IMPROVEMENTS:

 * Add tags to EIPs and NAT gateways
 * Add VPC endpoints for S3 and DynamoDB

## 4.1.0 (August 16, 2017)

IMPROVEMENTS:

 * Added enable/disable nat gateways in private subnets

## 4.0.0 (April 12, 2017)

BACKWARDS INCOMPATIBILITIES / NOTES:

  * Using length of `azs_list` as the sequential ID instead of static increment `+ 10`.

## 3.0.0 (February 20, 2017)

BACKWARDS INCOMPATIBILITIES / NOTES:

  * Change variable `azs_count` for `azs_list` (hardcoded set of variables)
  * In case you are upgrading to version 3.0.0 you should pass exactly same AZs that your already created VPC has in order not to force new resource.

## 2.1.0 (January 19, 2017)

FEATURES:

 * Adding default naming convention for the DHCP Options Set with format-like the standard one.

## 2.0.1 (January 10, 2017)

FEATURES:

 * Adding IGW and Public Route Table nametags.

## 2.0.0 (December 20, 2016)

FEATURES:

 * Dynamically allocated AZs (Only ammount of them is needed)
 * Dynamically allocated private/public subnets and NAT gateways.
 * DHCP options set

BACKWARDS INCOMPATIBILITIES / NOTES:

 * The AZs will be chosen by the module from now on.
 * The Subnets, Route tables and NAT Gateways are now exported as lists.

## 1.0.4 (September 27, 2016)

FEATURES:

 * VPC with 2 AZs
 * 2 x Public subnets
 * 2 x Private subnets, each one with a NAT gateway on each public subnet
 * DHCP options set

BACKWARDS INCOMPATIBILITIES / NOTES:

 * Tag variables are removed in favor of one single "tags" variable

IMPROVEMENTS:

 * Tags are assigned dinamically depending on user input
 * AmazonProvidedDNS is now the default DNS

## 1.0.3 (September 26, 2016)

FEATURES:

 * VPC with 2 AZs
 * 2 x Public subnets
 * 2 x Private subnets, each one with a NAT gateway on each public subnet
 * DHCP options set

BACKWARDS INCOMPATIBILITIES / NOTES:

 * Public and private subnet output is now a list and not comma-separated strings.

IMPROVEMENTS:

 * The use of split/join is not necessary anymore.
