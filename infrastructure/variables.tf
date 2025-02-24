variable "do_token" {
  description = "Digital Ocean API Token"
  type        = string
  sensitive   = true
}

variable "ssh_keygen_fingerprint" {
  description = "SSH key fingerprint from Digital Ocean"
  type        = string
}


