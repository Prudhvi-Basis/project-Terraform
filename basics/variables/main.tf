variable "URL" {
  default = "example.com"
}  # Declaring a variable in terraform

output "URL" {
  value = "var.URL"
}