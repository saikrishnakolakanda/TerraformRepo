
variable "db_instance_class" {}
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
variable "db_sg_id" {}
variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}
variable "az1" {}
variable "az2" {}
variable "env" {}
