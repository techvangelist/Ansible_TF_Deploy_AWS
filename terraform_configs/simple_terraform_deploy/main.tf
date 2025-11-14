terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.20.0"
    }
  }
  backend "s3" {
    #bucket = "rhel9-bootc-techv"
    #key = "asnell/tfstatefile"
    #region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}

# Fetch the default VPC
data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "tf-demo-aws-ec2-instance-1" {
  ami           = "ami-0fcb2d702e65ba9c1"
  instance_type = "t2.micro"
  tags = {
    Name = "tf-demo-aws-ec2-instance-1"
  }
}
