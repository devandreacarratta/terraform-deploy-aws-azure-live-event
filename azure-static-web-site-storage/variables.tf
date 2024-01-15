variable "project" {
  type        = string
  description = "Project name"
  nullable    = false
}

variable "environment" {
  type        = string
  description = "Environment (dev / stage / prod)"
  nullable    = false
}

variable "location" {
  type        = string
  description = "Azure region to deploy module to"
  nullable    = false
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default = {
    source = "terraform"
  }
}
