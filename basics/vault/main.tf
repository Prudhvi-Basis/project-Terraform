
provider "vault" {
  address = "https://172.31.91.125:8200"
  token = var.vault_token
  skip_tls_verify = true
}
variable "vault_token" {}

data "vault_kv_secret_v2" "example" {
  mount = "test"
  name  = "my_credentials"
}
resource "local_file" "" {
  content = data.vault_kv_secret_v2.example
  filename = "/tmp/secret"
}