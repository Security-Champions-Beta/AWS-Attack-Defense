### Insecure S3

---

- Step 1: Open terminal

- Step 2: Change Directory

```bash
cd insecure
```

- Step 3: Run `terraform init` to install related packages.

```commanline
terraform init
```

- Step 4: Run `terraform apply -auto-approve`

```commanline
terraform apply -auto-approve
```

- Step 5: In `InsecureBucketInfo` you will see a
  - BucketName
  - S3-URL(Console)

- Step 6: 

```commanline
 aws --profile test s3api list-buckets

 aws --profile test s3api list-objects --bucket (...)

 aws --profile test s3 cp s3://bucket/object .
 ```