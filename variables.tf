variable "options" {
  type = list

  default = [
    "ndots:1",
    "timeout:5",
  ]

  description = <<-DESCRIPTION
    Options for `resolv.conf`.
  DESCRIPTION
}

variable "domain" {
  type = string

  default = ""

  description = <<-DESCRIPTION
    Domain param for `resolv.conf`.
  DESCRIPTION
}

variable "search" {
  type = string

  default = "domain"

  description = <<-DESCRIPTION
    Search param for `resolv.conf`.
    If `domain`, `var.domain` will be used as value.
  DESCRIPTION
}

variable "nameservers" {
  type = list

  default = ["8.8.8.8", "8.8.4.4"]

  description = <<-DESCRIPTION
    List of DNS servers for DNS client settings.
  DESCRIPTION
}

variable "hosts" {
  type = list

  default = []

  description = <<-DESCRIPTION
    List of IP-addresses or FQDNs.
    Used for updating `resolv.conf`.
  DESCRIPTION
}

variable "connection_timeout" {
  type = string

  default = "2m"

  description = <<-DESCRIPTION
    SSH connection timeout.
  DESCRIPTION
}

variable "user" {
  type = string

  description = <<-DESCRIPTION
    Required.
    Connect to hosts with this username.
  DESCRIPTION
}

variable "private_key" {
  type = string

  description = <<-DESCRIPTION
    Required.
    Private SSH key for authorizing.
  DESCRIPTION
}
