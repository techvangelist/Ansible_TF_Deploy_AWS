terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.20.0"
    }

    aap = {
      source = "ansible/aap"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "tf-demo-aws-ec2-instance-2" {
  ami           = "ami-0fcb2d702e65ba9c1"
  instance_type = "t2.micro"
  tags = {
    Name = "tf-demo-aws-ec2-instance-2"
  }
}

provider "aap" {
  host     = "https://intrepid.leadloud.net/"
  username = "admin"
  password = "ansible123!"
  insecure_skip_verify = true
}

resource "aap_host" "tf-demo-aws-ec2-instance-2" {
  inventory_id = 2
  name = "aws_instance_tf-demo-aws-ec2-instance-2"
  description = "An EC2 instance created by Terraform"
  variables = jsonencode(aws_instance.tf-demo-aws-ec2-instance-2)
}
