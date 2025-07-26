provider "aws" {
  
}
resource "aws_instance" "name" {
    ami = "ami-08a6efd148b1f7504"
    instance_type = "t2.micro"
    #key_name = "test"
  
}


#If we want to re-run the resources, we can use taint(simple: destroy and create)