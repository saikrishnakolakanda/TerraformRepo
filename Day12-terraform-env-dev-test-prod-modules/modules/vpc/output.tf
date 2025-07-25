output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "subnet1" {
  value = aws_subnet.rds_subnet1.id
  
}

output "subnet2" {
  value = aws_subnet.rds_subnet2.id
  
}

output "vpc_id" {
  value = aws_vpc.main.id
}
