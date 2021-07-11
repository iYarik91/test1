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

esource "aws_security_group_rule" "port443" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["172.31.0.0/16"]
  security_group_id = "sg-9beccaee"
}

resource "aws_security_group_rule" "port80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["172.31.0.0/16"]
  security_group_id = "sg-9beccaee"
}

resource "aws_security_group_rule" "port5000" {
  type              = "ingress"
  from_port         = 5000
  to_port           = 5000
  protocol          = "tcp"
  cidr_blocks       = ["172.31.0.0/16"]
  security_group_id = "sg-9beccaee"
}

resource "aws_security_group_rule" "port22" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["172.31.0.0/16"]
  security_group_id = "sg-9beccaee"
}

resource "aws_instance" "app_server" {
    ami           = "ami-05f7491af5eef733a"
    instance_type = "t2.micro"
    key_name = "yarikaws"
    tags = {
        Name = "HelloDockerworld"
    }
}
