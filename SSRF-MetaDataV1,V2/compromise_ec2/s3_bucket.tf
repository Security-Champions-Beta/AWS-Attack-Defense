resource "aws_s3_bucket" "ssrf_bucket" {
    bucket   =  format("%s-ssrf",random_string.random_name.result)
    acl = "private"
    force_destroy = true
}

resource "aws_s3_bucket_object" "uploadfiles" {
  bucket = aws_s3_bucket.ssrf_bucket.id
  key = "creditcardnumbers.txt"
  source = "creditcardnumbers.txt"
  depends_on = [aws_s3_bucket.ssrf_bucket]
}
