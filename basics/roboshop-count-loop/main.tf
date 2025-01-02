variable "instances" {
  default = {
    frontend = {}
    cart = {}
    catalogue = {}
    user = {}
    shipping = {}
    payment = {}
    mysql = {}
    mongodb = {}
    rabbitmq = {}
    redis = {}
  }
}
resource "aws_instance" "instance" {
  for_each = var.instances
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0b308c7134616a7ce"]
  tags = {
     Name = each.key #var.instances[count.index] for list

  }
}
resource "aws_route53_record" "record" {
  for_each = var.instances
  zone_id = "Z00196431INWTJ0O5YT57"
  name    = "${each.key}-dev.devops11.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.key].private_ip]
}

#####
A BIG NOTE HERE WHEN LIST IS USED WE USE COUNT = LENGTH(VVAR.INSTANCES) AND WHEN MAP IS USED WE USE FOR_EACH = VAR.INSTANCES