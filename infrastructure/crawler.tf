resource "aws_glue_crawler" "glue_crawler" {
  database_name = "igti_du"
  name          = "igti_rais_processing_crawler"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3://igti-rais-prod-staging-zone/staging-zone/rais/"
  }

  tags = local.common_tags

}

resource "aws_glue_catalog_database" "stream" {
  name = "streamingdb"
}

resource "aws_glue_crawler" "stream" {
  database_name = aws_glue_catalog_database.stream.name
  name          = "firehose_stream_s3_crawler"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3://${aws_s3_bucket.stream.bucket}/firehose/"
  }

  configuration = <<EOF
{
   "Version": 1.0,
   "Grouping": {
      "TableGroupingPolicy": "CombineCompatibleSchemas" }
}
EOF

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}