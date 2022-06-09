resource "local_file" "aws_key" {
  content = tls_private_key.mhn_ssh_key.private_key_pem
  filename = "mhn_ssrf.pem"
}



output "ProvisionedServerInfo" {
  value = {
    URL = format("http://%s",aws_instance.wb.public_dns)
    EC2-DNS = aws_instance.wb.public_dns
    S3-Bucket-Name = aws_s3_bucket.ssrf_bucket.bucket
    SSH-Key-Name = format("%s.pem",aws_key_pair.ssh.key_name) 
  }
}