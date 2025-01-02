variable "instances" {
  default = [
    "testA",
    "testB"

  ]
}
module "ec2" {
  count = length(var.instances)

  source = "./ec2"
  instance_name = var.instances[count.index]
}
output "ip" {
  value = module.ec2
}
# module "route53" {
#   count = length(var.instances)
#   source = "./route53"
#   instance_name = var.instances[count.index]
#   ip_address = module.ec2[count.index].ip_address
# }
