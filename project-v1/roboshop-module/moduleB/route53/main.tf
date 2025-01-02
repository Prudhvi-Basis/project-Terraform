
resource "aws_route53_record" "record" {

  zone_id = "Z00196431INWTJ0O5YT57"
  name    = "${var.instance_name}-dev.devops11.online"
  type    = "A"
  ttl     = 30
  records = [var.ip_address]
}
variable "instance_name" {}
variable "ip_address" {}