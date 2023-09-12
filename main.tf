provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "private_ec2" {
  ami           = "ami-053b0d53c279acc90"
  key_name      = "ec2-keypair"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private.id
}
tags = {
    name = "private-ec2"
}


resource "aws_instance" "public_ec2" {
  ami           = "ami-053b0d53c279acc90"
  key_name      = "ec2-keypair"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
  tags = {
    name = "public-ec2"
  }
}

