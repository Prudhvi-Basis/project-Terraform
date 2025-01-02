
module "ec2" {
  count = length(var.instances)

  source = "./ec2"
  instance_name = var.instances[count.index]
}
#
# module "route53" {
#   source = "./route53"
# }
variable "instances" {
  default = [
    testA,
    testB

  ]
}