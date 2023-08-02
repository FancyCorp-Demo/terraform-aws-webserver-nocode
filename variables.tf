variable "packer_bucket_name" {
  type        = string
  description = "Which HCP Packer bucket should we pull our AMI from?"
}

variable "packer_channel" {
  type        = string
  description = "Which HCP Packer channel should we use for our AMI?"
}

variable "instance_type" {
  type        = string
  description = "How big of an instance should we create?"
}

variable "aws-region" {
  type = string
}

variable "name" {
  type        = string
  description = "A name to identify the your Webserver"
}

variable "owner" {
  type        = string
  description = "Who owns these resources?"
}
