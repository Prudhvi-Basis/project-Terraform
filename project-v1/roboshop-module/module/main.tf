resource "aws_instance" "frontend" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0b308c7134616a7ce"]
  tags = {
    Name = var.component_name
  }
}
resource "aws_route53_record" "record" {
  zone_id = "Z00196431INWTJ0O5YT57"
  name    = "${var.component_name}-dev.devops11.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.private_ip]
}
variable "component_name" {}