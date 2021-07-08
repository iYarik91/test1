terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.44"
    }
  }

  required_version = ">= 0.15.5"
}

provider "aws" {
    profile = "default"
    region  = "eu-central-1"
}

resource "aws_instance" "app_server" {
    ami           = "ami-05f7491af5eef733a"
    instance_type = "t2.micro"
    key_name = "yarikaws"
    tags = {
        Name = "HelloDockerworld"
    }
}
