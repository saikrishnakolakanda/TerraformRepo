terraform {
  backend "s3" {
    bucket = "teraformhkhtecre"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
