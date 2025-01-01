variable "url" {
  default = "Prabhas.com"
}  # Declaring a variable in terraform

# output "URL" {
#   value = var.url
# }

output "URL1"
  value = "url - ${var.url}"
}