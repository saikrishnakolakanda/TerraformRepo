output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}

output "subnet1_id" {
  value = aws_subnet.sub1.id
}

output "subnet2_id" {
  value = aws_subnet.sub2.id
}

