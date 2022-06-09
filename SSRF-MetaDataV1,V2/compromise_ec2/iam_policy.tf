resource "aws_iam_role_policy" "ssrf_policy" {
  name = "ssrf_policy"
  role = aws_iam_role.ssrf_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
