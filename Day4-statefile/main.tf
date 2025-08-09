provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  default = "us-east-1"
}






resource "aws_instance" "name" {
  ami = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
  key_name = "key1"
  tags = {
    Name = "day-6"
  }
}
