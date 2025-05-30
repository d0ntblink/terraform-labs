/* Challenge Solution - Terrform and AWS 
   main.tf */

terraform {
  required_providers {
    aws = {
      # short for registry.terraform.io/hashicorp/aws
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}


/* Provider Block
   declare the specified provider and other settings */

provider "aws" {
  profile = "default"
  region  = var.region
}


/* Resource Block
   The resources to build (EC2, S3 bucket, etc.)       
resource <resource type> <resource name>  */
resource "aws_instance" "app_server" {
  # ami points to an ubuntu image (these are unique per region)
  ami           = var.ami
  # size of the machine is t2.micro
  instance_type = var.instance_type
  # tag is metadata information
  vpc_security_group_ids = [aws_security_group.gary_ssh.id]
  key_name               = aws_key_pair.deployer.key_name
  tags = {
    Name = var.name
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  # use the file() function to lookup data
  public_key = file("~/.ssh/key.pub")
}

resource "aws_security_group" "gary_ssh" {
  name = "gary_ssh"
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  // connectivity to ubuntu mirrors is required to run `apt-get update` and `apt-get install apache2`
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
