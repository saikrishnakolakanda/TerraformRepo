resource "aws_instance" "name" {
    ami = var.ami_ID
    instance_type = var.instancetype
    key_name = var.key
    availability_zone = var.az
    tags = {
     Name = var.tag
    }
    
}
  
  resource "aws_s3_bucket" "name" {
    bucket = var.bucket
    
  }