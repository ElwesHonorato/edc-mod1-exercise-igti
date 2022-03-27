resource "aws_s3_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl    = "private"
  source = "../job_spark.py"
  etag   = filemd5("../job_spark.py") # Update file if there is any changes, without this part of code it would be replaced at every run.
}

# resource "aws_s3_object" "codigo_spark" {
#   bucket = aws_s3_bucket.datalake.id
#   key    = "emr-code/pyspark/lambda_function.py"
#   acl    = "private"
#   source = "../etl/lambda_function.py"
#   etag   = filemd5("../etl/lambda_function.py") # Update file if there is any changes, without this part of code it would be replaced at every run.
# }

resource "aws_s3_object" "parquet_insert" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/parquet_spark_insert.py"
  acl    = "private"
  source = "../etl/parquet_spark_insert.py"
  etag   = filemd5("../etl/parquet_spark_insert.py") # Update file if there is any changes, without this part of code it would be replaced at every run.
}

