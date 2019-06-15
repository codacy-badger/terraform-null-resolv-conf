terraform {
  required_version = "~> 0.12.1"
}

module "resolv_conf" {
  source = "github.com/4ops/terraform-null-resolv-conf"
  domain = "example.com"
  search = "sub.example.com example.com"
  # hosts       = ["10.0.0.1", "10.0.0.2", "myserver.example.com"]
  # user        = "root"
  # private_key = tls_private_key.root_key.public_key_openssh
}
