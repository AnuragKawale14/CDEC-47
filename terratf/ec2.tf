provider "aws" {
    region = "us-east-2"
}





resource "aws_instance" "my-ec2"{
    ami = var.image-id
    instance_type = var.instance_type
    key_name = var.my-key
     # security_groups = ["default"]
vpc_security_group_ids = [aws_security_group.my-sg.id]

 user_data = <<-EOT
    #!/bin/bash
    yum update -y
    yum install httpd -y
    systemctl start httpd
    systemctl enable httpd
    EOT

tags = {
     Name = "my-server"
}

}

variable "image-id" {
    type = string
    description = "this var block is for ami id"
    default = "ami-0f5fcdfbd140e4ab7"
}
variable "instance_type" {
    type = string
    description = "this var block is for ami id"
    default = "t3.micro"
}

variable "my-key" {
    type = string
    description = "this var block is for ami id"
    default = "ohio-soheb-key"
}

output "instance_public_ip" {
  value = aws_instance.my-ec2.public_ip
  description = "Public IP address of the instance."

}
