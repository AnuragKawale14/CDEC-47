provider "aws" {
    region = "eu-north-1"
}

module "my-vpc-module" {
    source = "./module/vpc"
}