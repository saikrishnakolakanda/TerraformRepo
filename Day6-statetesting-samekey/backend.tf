terraform {
  backend "s3" {
    bucket = "teraformhkhtecre"
    key    = "Day6/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    #dynamodb_table = "terra"
    #encrypt = true
  }
}
