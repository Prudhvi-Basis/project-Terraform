resource "aws_instance" "server" {
  ami = data.aws_ami.ami.id
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0b308c7134616a7ce"]
  tags = {
    Name = "server"
  }
}
data "aws_ami" "ami" {

  most_recent = true
  name_regex  = "RHEL-9-DevOps-Practice"
  owners = ["973714476881"]

}
data "aws_security_group" "sg" {
  name = "allow-all"
}