#vpc creation
resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "vpc01"
    }
}
#subnet creation
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "test-subnet"
    }
}
#IG
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
        Name = "IGW"
    }
  
}
#Route Table
resource "aws_route_table" "name" {
    vpc_id = aws_vpc.name.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id
    }
    tags = {
    Name ="pub-RT"
  }
  
}

#Subnet association
resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
}

resource "aws_eip" "nat" {
  tags = {
    Name = "NAT EIP"
  }
}

#nat
resource "aws_nat_gateway" "name" {
    subnet_id = aws_subnet.name.id
    allocation_id = aws_eip.nat.allocation_id
  tags = {
    Name ="NatGW"
  }
}

#pvt-subnet creation
resource "aws_subnet" "pvt" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "pvt-subnet"
    }
}

#Route Table
resource "aws_route_table" "pvt" {
    vpc_id = aws_vpc.name.id
    route {
        cidr_block = "0.0.0.0/0"
       nat_gateway_id = aws_nat_gateway.name.id
    }
  tags = {
    Name ="pvt-RT"
  }
}

#Subnet association
resource "aws_route_table_association" "pvt" {
    subnet_id = aws_subnet.pvt.id
    route_table_id = aws_route_table.pvt.id
}



#security group
resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "Sec-Grp"
    }
ingress {
    description = "TLS from vpc"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]
}
ingress {
    description = "TLS from vpc"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]
}
egress {
    from_port = 0
    to_port = 0
    protocol = "-1" # all protocols
    cidr_blocks = [ "0.0.0.0/0" ]
}
}

#ec2 creation
resource "aws_instance" "name" {
  ami = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.name.id
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
}
