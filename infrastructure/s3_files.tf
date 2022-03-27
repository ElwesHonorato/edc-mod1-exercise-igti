resource "aws_s3_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_tf"
  acl    = "private"
  source = "../job_spark.py"
  etag   = filemd5("../job_spark.py") # Update file if there is any changes, without this part of code it would be replaced at every run.
}