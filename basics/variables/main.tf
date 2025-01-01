variable "url" {
  default = "Prabhas"
}  # Declaring a variable in terraform

output "url" {
  value = "var.url"
}