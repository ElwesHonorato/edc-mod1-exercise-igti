variable "base_bucket_name" {
  default = "datalake-igti-tf"
}

variable "ambiente" {
  default = "producao"
}

variable "numero_conta" {
  default = "151128108040"
}

variable "aws_region" {
    default = "us-east-2"
}

# Centralize Terraform control file
terraform {
    backend "s3" {
        bucket = "terraform-state-igti-elwes"
        key    = "state/igti/edc/mod1/terraform.tfstate"
        region = "us-east-2"
    }
}