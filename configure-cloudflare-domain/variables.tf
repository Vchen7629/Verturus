variable "cloudflare-api-token" {
  description = "Variable for Cloudflare Api Token"
  type = string
}

variable "cloudflare_zone_id" {
  description = "Variable to recognize the domain"
  type = string
}

variable "ipv4_address" {
  description = "ip address for vps ipv4 address"
  type = string
}

variable "ipv6_address" {
  description = "ip address for vps ipv6 address"
  type = string
}