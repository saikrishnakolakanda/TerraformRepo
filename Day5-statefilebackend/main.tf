resource "aws_instance" "name" {
  ami = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
  key_name = "key1"
  tags = {
    Name = "day-4"
  }
}

resource "aws_s3_bucket" "name" {
    bucket = "teraformhkhtecre"
  
}
resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
  
}