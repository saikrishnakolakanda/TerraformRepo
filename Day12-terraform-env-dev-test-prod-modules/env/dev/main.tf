provider "aws" {
  region = var.region
  #profile = "dev"
}

module "vpc" {
  source              = "../../modules/vpc"
  cidr_block          = var.vpc_cidr             # ✅ Correct name
  availability_zone   = var.availability_zone      # ✅ Correct name
  public_subnet_cidr  = var.public_subnet_cidr     # ✅ Correct name
  subnet1 = var.subnet1
  subnet2 = var.subnet2
  env                 = var.env
  az1 = var.az1
  az2 = var.az2
}

module "ec2" {
  source        = "../../modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  env           = var.env
 subnet_id     = module.vpc.public_subnet_id
  
}


module "rds" {
  source   = "../../modules/rds"
  db_sg_id          = module.sg.db_sg_id 
  db_instance_class = var.db_instance_class
  db_name = var.db_name
  db_user = var.db_user
  db_password = var.db_password
  subnet_ids = [module.vpc.subnet1, module.vpc.subnet2]
  az1               = var.az1
  az2               = var.az2
  env        = var.env
}

module "sg" {
  source = "../../modules/sg"
  vpc_id = module.vpc.vpc_id

}
