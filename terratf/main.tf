provider "aws" {
    region = "us-west-2"
}

module "my-vpc-module" {
    source = "./module/vpc "
}



terraform {
  backend "s3" {
    bucket         = "s3-demo-backend-9886"
    key            = "prod/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    use_lockfile = true
    dynamodb_table = "new-db-table-s3"
  }
}