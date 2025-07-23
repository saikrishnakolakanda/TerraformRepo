variable "ami_ID" {
    description = "inserting ami value into main.tf"
    type = string
  default = ""
}

variable "instancetype" {
    type = string
    default = ""
}

variable "key" {
    type = string
    default = ""
}

variable "az" {
    type = string
    default = ""
}
 
 variable "tag" {
    type = string
    default = ""
   
 }

 variable "bucket" {
 type = string
  default = ""
}