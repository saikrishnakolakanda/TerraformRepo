resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_id
  availability_zone = var.az1
}



resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1_id
  availability_zone = var.az2
}


resource "aws_subnet" "sub2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet2_id
  availability_zone = var.az3
}
