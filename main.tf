provider "aws" {
  default_tags {
    tags = {
      Name      = "StrawbTest - ${terraform.workspace}"
      Owner     = "lucy.davinhart@hashicorp.com"
      Purpose   = "Terraform TFC Demo Org (FancyCorp)"
      TTL       = "24h"
      Terraform = "true"
      Source    = "https://github.com/FancyCorp-Demo/terraform-aws-webserver-nocode"
      Workspace = terraform.workspace
    }
  }
  region = var.aws-region
}

module "webserver" {
  source  = "app.terraform.io/fancycorp/webserver/aws"
  version = "<= 2.0.0"

  packer_bucket_name = var.packer_bucket_name
  packer_channel     = var.packer_channel

  instance_type = var.instance_type

  vpc_name = terraform.workspace
}

