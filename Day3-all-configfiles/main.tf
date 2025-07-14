resource "aws_instance" "name" {
    ami = var.ami_ID
    instance_type = var.instancetype
    key_name = "key1"
    tags = {
        Name = "server1"
    }
  
}
resource "aws_instance" "serv2" {
    ami = var.ami_ID
    instance_type = var.instancetype
    key_name = "key1"
    tags = {
        Name = "server2"
    }
  
}