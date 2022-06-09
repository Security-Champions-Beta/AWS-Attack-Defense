terraform {
  required_version = ">= 0.12.0"
}

resource "random_string" "bucket_name" {
  length = 10
  special = false
  upper = false
}

resource "aws_s3_bucket" "private_bucket" {
  bucket = format("pre-signed-%s",random_string.bucket_name.result)
  force_destroy = true
  acl    = "private"
}

resource "aws_s3_bucket_object" "hello_file" {
  bucket = aws_s3_bucket.private_bucket.bucket
  key = "image.jpg"
  source = "image.jpg"
}


output "PresignedBucketInfo" {
  value = {
      BucketName = aws_s3_bucket.private_bucket.bucket
      URL = format("https://s3.console.aws.amazon.com/s3/buckets/%s/?region=%s",aws_s3_bucket.private_bucket.bucket,var.aws_region)
      fileName = "image.jpg"
  }
}