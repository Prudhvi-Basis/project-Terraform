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
  count = length(var.instances)
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0b308c7134616a7ce"]
  tags = {
    Name = var.instances[count.index]

  }
}
resource "aws_route53_record" "records" {
  count = length(var.instances)
  zone_id = "Z00196431INWTJ0O5YT57"
  name    = "${var.instances[count.index]}-dev.devops11.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[count.index].private_ip]
}