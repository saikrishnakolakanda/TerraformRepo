resource "aws_instance" "name" {
    ami = var.ami_ID
    instance_type = var.instancetype
    key_name = "key1"
    tags = {
        Name = "server1"
    }
}
  