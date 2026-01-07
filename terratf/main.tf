provider "aws" {
    region = "eu-north-1"
}

module "my-vpc-module" {
    source = "./module/vpc"
}



terraform {
  backend "s3" {
    bucket         = "s3-buck-14"
    key            = "prod/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    use_lockfile = true
    dynamodb_table = "db-table-14"
  }
}
