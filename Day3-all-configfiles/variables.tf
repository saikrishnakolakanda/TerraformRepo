variable "ami_ID" {
    description = "inserting ami value into main.tf"
    type = string
  default = ""
}

variable "instancetype" {
    type = string
    default = ""
}