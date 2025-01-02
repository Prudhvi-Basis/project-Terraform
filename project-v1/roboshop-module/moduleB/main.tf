variable "instances" {
  default = [
    test1,
    test2
  ]
}

module "ec2" {
  count = length(var.instances)

  source = "./ec2"
  name = var.instances[count.index]
}
#
# module "route53" {
#   source = "./route53"
# }
