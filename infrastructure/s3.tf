resource "aws_s3_bucket" "datalake" {
  # Configuration parameters of the choosen resource
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"
  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket" "staging-zone" {
  # Configuration parameters of the choosen resource
  bucket = "${var.s3_rais_staging_zone}"
  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket" "stream" {
  # Configuration parameters of the choosen resource
  bucket = "igti-elwes-streaming-bucket"
  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
}