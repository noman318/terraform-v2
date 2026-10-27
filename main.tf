terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  required_version = ">= 1.15.5"
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "terraform_server" {
    ami           = "ami-022374b883d9d7931"
    instance_type = "t3.micro"
    key_name = "default-new"
    subnet_id = "subnet-00760a8fce3bc0940"

    tags = {
        Name = "Terraform_Demo"
    }
}