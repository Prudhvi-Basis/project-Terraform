variable "url" {
  default = "Prabhas.com"
}  # Declaring a variable in terraform

output "url" {
  value = var.url
}

output "url1"
  value = "URL - ${var.URL}"