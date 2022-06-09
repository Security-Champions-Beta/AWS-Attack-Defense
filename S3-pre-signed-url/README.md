# Pre-signed URL

* Step 1: Change Directory

```bash
cd pre-signed-url
```
* Step 2: Run `terraform init` to install related packages.

```bash
terraform init
```

* Step 3: Run `terraform apply -auto-approve`

```bash
terraform apply -auto-approve
```

* Step 4: In `PresignedBucketInfo` you will see a

  - BucketName
  - URL
  - FileName

* Step 5: create pre signed URL for the object
```bash
aws s3 presign s3://<BucketName>/<fileName>
```

* Step 6: You will see a output with a URL

* Step 7: Now Copy the URL and paste in the browser now you can see a file on the browser