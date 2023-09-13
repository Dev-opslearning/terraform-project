resource "aws_vpc" "test_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.resource_name}_vpc"
  }
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.private_subnet_cidr
  tags = {
    Name = "${var.resource_name}_private_sn"
  }

}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = var.public_subnet_cidr
  tags = {  
    Name = "${var.resource_name}_public_sn"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {  
    Name = "${var.resource_name}_igw"
  }
}

resource "aws_eip" "elastic-ip" {
  domain   = "vpc"
  tags = {  
    Name = "${var.resource_name}_eip"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "${var.resource_name}_ngw"
  }
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = var.route1_cidr_block
    gateway_id = aws_nat_gateway.ngw.id
  }
}

resource "aws_route_table" "rt2" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = var.route2_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rts1" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_route_table_association" "rts2" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt2.id
}

resource "aws_security_group" "sg" {
  name   = "${var.resource_name}_sg"
  vpc_id = aws_vpc.test_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.test_vpc.cidr_block]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.egress_cidr
  }
  tags = {
    Name = "${var.resource_name}_sg"
  }
}