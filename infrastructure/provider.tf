provider "aws" {
  region = var.aws_region
}

# Centralize Terraform control file
terraform {
    backend "s3" {
        bucket = "terraform-state-igti-elwes"
        key    = "state/igti/edc/mod1/terraform.tfstate"
        region = "us-east-2"
    }
}