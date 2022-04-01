variable "base_bucket_name" {
  default = "datalake-igti-tf"
}
variable "prefix" {
  default = "igti-elwes-rais"
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

variable "lambda_function_name" {
    default = "IGTIexecutaEMR"
}

variable "s3_rais_staging_zone" {
    default = "igti-rais-prod-staging-zone"
}

# Prefix configuration and project common tags
locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Project      = "RAIS"
    ManagedBy    = "Terraform"
    Department   = "IGTI",
    Provider     = "Honorato",
    Owner        = "Data Engineering"
    BusinessUnit = "Data"
    Billing      = "Infrastructure"
    Environment  = terraform.workspace
    UserEmail    = "elweshonorato@gmail.com"
  }
}