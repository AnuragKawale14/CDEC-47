provider "aws" {
    region = "us-west-2"
}

module "my-vpc-module" {
    source = ./module/vpc
}