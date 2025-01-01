variable "URL" {
  default = "example.com"
}  # Declaring a variable in terraform

output "url" {
  value = var.url
}