resource "aws_instance" "name" {
    ami = "ami-05ffe3c48a9991133"
    instance_type = "t2.micro"
    #key_name = "key1"
    tags = {
      Name = "dev"
    }
    

  lifecycle {
    create_before_destroy = true
  }
#   lifecycle {
#     ignore_changes = [ tags ]
#   }
#   lifecycle {
#     prevent_destroy = true
#   }
}