terraform {
  required_version = ">= 0.13.0"
}

variable "aws_region" {
  default = "us-west-2"
}

provider "aws" {
  region = var.aws_region
}
