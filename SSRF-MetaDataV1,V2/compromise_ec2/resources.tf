# Define SSH key pair for our instances

resource "random_string" "random_name" {
  length  = 10
  special = false
  upper   = false
}

resource "tls_private_key" "mhn_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  key_name   =  format("mhn_ssh_key-%s",random_string.random_name.result)
  public_key = tls_private_key.mhn_ssh_key.public_key_openssh
}

resource "aws_iam_instance_profile" "ssrf_profile" {
  name = "ssrf_profile"
  role = aws_iam_role.ssrf_role.id
  depends_on = [aws_iam_role.ssrf_role]
}

resource "aws_instance" "wb" {
  depends_on = [aws_iam_instance_profile.ssrf_profile]
  ami = data.aws_ami.amz_linux.id
  instance_type = "t1.micro"
  iam_instance_profile = aws_iam_instance_profile.ssrf_profile.name
  key_name = aws_key_pair.ssh.key_name
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.securtiy_group.id]
  associate_public_ip_address = true
  source_dest_check = false
 user_data = file("script.sh")
  tags = {
    Name = "Web Application"
  }
}

resource "null_resource" "wb" {
  depends_on = [aws_instance.wb]
  connection {
    type = "ssh"
    user = "ubuntu"
    agent = false
    private_key = tls_private_key.mhn_ssh_key.private_key_pem
    host        = aws_instance.wb.public_ip
    timeout = "10m"
  }

  provisioner "file" {
    source = "weasyprint-ssrf"
    destination = "/tmp/"
  }
  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }

}