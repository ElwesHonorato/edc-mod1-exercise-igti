resource "aws_s3_bucket" "datalake" {
  # Configuration parameters of the choosen resource
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"
  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
}