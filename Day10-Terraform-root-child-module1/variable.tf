variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "subnet_id" {
  default = "10.0.0.0/24"
}

variable "subnet1_id" {
  default = "10.0.1.0/24"
}

variable "subnet2_id" {
  default = "10.0.2.0/24"
}

variable "az1" {
    default = "us-east-1a"
}

variable "az2" {
    default = "us-east-1b"
}

variable "az3" {
    default = "us-east-1c"
}

variable "ami_id" {
default = "ami-05ffe3c48a9991133"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "instance_class" {
    default = "db.t3.micro"
}

variable "db_name" {
  default = "mydb"
}

variable "db_user" {
    default = "admin"
}

variable "db_password" {
    default = "Admin12345"
}