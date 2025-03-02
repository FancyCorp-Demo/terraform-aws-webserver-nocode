provider "aws" {
  default_tags {
    tags = {
      Name      = "${var.name} - ${terraform.workspace}"
      Owner     = var.owner
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
  version = "<= 2.0.0, >= 1.3.1"

  packer_bucket_name = var.packer_bucket_name
  packer_channel     = var.packer_channel

  instance_type = var.instance_type

  vpc_name = terraform.workspace
}

