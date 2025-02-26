variable "do_token" {
  description = "Digital Ocean API Token"
  type        = string
  sensitive   = true
}

variable "droplet_id" {
    description = "Digital Ocean Droplet ID"
    type = number
}