variable "url" {
  default = "Prabhas.com"
}  # Declaring a variable in terraform

output "url" {
  value = var.url
}