module "prod" {
    source = "github.com/saikrishnakolakanda/TerraformRepo//Day9-Modules"
    ami_ID = "ami-05ffe3c48a9991133"
    instancetype = "t2.micro"
    az = "us-east-1a"
}