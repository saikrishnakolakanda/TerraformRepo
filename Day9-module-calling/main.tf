module "project" {
    source = "../Day9-Modules"
    ami_ID = "ami-05ffe3c48a9991133"
    instancetype = "t2.micro"
    key = "key1"
    az = "us-east-1a"
    tag = "prod"
    #bucket = "kihndbhhdjhsjjd"
}

