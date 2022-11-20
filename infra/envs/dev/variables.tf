variable "app_version" {
  type = string
}

variable "SENDGRID_API_KEY" {
  type      = string
  sensitive = true
}
