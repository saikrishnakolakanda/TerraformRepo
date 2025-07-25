
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.env}-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env}-public-subnet"
  }
}


resource "aws_subnet" "rds_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet1
  availability_zone       = var.az1
  tags = {
    Name = "${var.env}-rds1-subnet"
  }
}

resource "aws_subnet" "rds_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet2
  availability_zone       = var.az2
  tags = {
    Name = "${var.env}-rds2-subnet"
  }
}