provider "aws" {
  region = "eu-north-1"  # Specify the AWS region
}

resource "aws_instance" "my_instance" {
  ami             = "ami-0fa91bc90632c73c9"
  instance_type   = "t3.micro"
  key_name        = "Stockholmkey"
  security_groups = ["default"]  # Ensure this security group exists

  tags = {
    ENV = terraform.workspace
    Name = "My-Terraform-Instance"
  }

}