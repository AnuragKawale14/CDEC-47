provider "aws" {
    region = "us-west-2"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/18"

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "main-sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pub-sub
  map_public_ip_on_launch = true

 tags = {
    Name = "pub-sub"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-igw-main"
  }
}

resource "aws_default_route_table" "main-rt" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  

  tags = {
    Name = "RT"
  }
}

resource "aws_instance" "my-ec2"{
    ami = var.image-id
    instance_type = var.instance_type
    key_name = var.my-key
     # security_groups = ["default"]
    vpc_security_group_ids = [aws_security_group.my-sg.id]
    subnet_id = aws_subnet.main-sub.id

 tags = {
    Name = "my-vpc-inst"
    
}

}

resource "aws_security_group" "my-sg" {

  name        = "my-sg2"
  description = "allow all traffic"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-new-sg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}