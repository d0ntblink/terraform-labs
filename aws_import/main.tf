/*
CHALLENGE 01 - Perform the following tasks:

    Create a file, main.tf that describes a single instance to be built in AWS
    Define an AWS provider
    Create a Terraform config file that uses a variable for the values region, ami, instance_type, and name
    The default value of instance_type should be t2.micro
    The default value of name should be AltaResearch<yourinitials>
    The default value of region should be us-west-2
    The default value of ami should be ami-08d70e59c07c61a3a
*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = var.region
}

resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}