module "vpc" {
  source       = "./modules/vpc"
  cidr_block   = var.cidr_block
  subnet_id = var.subnet_id
  subnet1_id = var.subnet1_id
  subnet2_id = var.subnet2_id
  az1          = var.az1
  az2          = var.az2
  az3          = var.az3
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id  # Replace with valid AMI
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
}

module "rds" {
  source         = "./modules/rds"
  subnet_ids = [module.vpc.subnet1_id, module.vpc.subnet2_id]
  instance_class = var.instance_class
  db_name        = var.db_name
  db_user        = var.db_user
  db_password    = var.db_password
}
