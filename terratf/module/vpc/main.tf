provider "aws" {
<<<<<<< HEAD
    region = "us-west-2"
=======
    region = "eu-north-1"
>>>>>>> 73c8c3c (new-update)
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/18"

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "main-sub" {
  vpc_id     = aws_vpc.main.id
<<<<<<< HEAD
  cidr_block = var.pub-sub
  map_public_ip_on_launch = true

 tags = {
=======
  cidr_block = var.pub-sub 
  map_public_ip_on_launch = true

  tags = {
>>>>>>> 73c8c3c (new-update)
    Name = "pub-sub"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
<<<<<<< HEAD
    Name = "my-igw-main"
=======
    Name = "my-igw-tf"
>>>>>>> 73c8c3c (new-update)
  }
}

resource "aws_default_route_table" "main-rt" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

<<<<<<< HEAD
  

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
=======
  tags = {
    Name = "my-RT"
  }
}


resource "aws_instance" "my-ec2" {
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
  name        = "my-sg7"
>>>>>>> 73c8c3c (new-update)
  description = "allow all traffic"
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-new-sg"
  }

  ingress {
<<<<<<< HEAD
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


=======
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

>>>>>>> 73c8c3c (new-update)
}