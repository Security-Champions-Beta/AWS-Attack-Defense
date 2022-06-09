terraform {
  required_version = ">= 0.12.0"
}

resource "random_string" "bucket_name" {
  length = 10
  special = false
  upper = false
}

resource "aws_s3_bucket" "public_bucket" {
  bucket = format("insecuremhn-%s",random_string.bucket_name.result)
  acl = "public-read"
  force_destroy = true
}

resource "aws_s3_bucket_object" "hello_file" {
  bucket = aws_s3_bucket.public_bucket.bucket
  key = "image.jpg"
  source = "image.jpg"
}

output "InsecureBucketInfo" {
  value = {
      BucketName = aws_s3_bucket.public_bucket.bucket
      URL = format("https://s3.console.aws.amazon.com/s3/buckets/%s/?region=%s",aws_s3_bucket.public_bucket.bucket,var.aws_region)
      fileName = "image.jpg"
  }
}