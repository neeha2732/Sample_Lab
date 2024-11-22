# Configure VPC 
resource "aws_vpc" "Example_vpc" {
  cidr_block       = var.vpc_cidr_block
 
  tags = {
    Name = var.vpc_name
  }
}

#Public Subnet
resource "aws_subnet" "Example_public_subnet" {
  vpc_id     = aws_vpc.Example_vpc.id
  cidr_block = var.pub_sub_cidr

  tags = {
    Name = var.public_sub_name
  }
}

#Private Subnet
resource "aws_subnet" "Example_private_subnet" {
  vpc_id     = aws_vpc.Example_vpc.id
  cidr_block = var.pvt_sub_cidr

  tags = {
    Name = var.private_sub_name
  }
}

#Internet Gateway
resource "aws_internet_gateway" "Example_IGW" {
  vpc_id = aws_vpc.Example_vpc.id

  tags = {
    Name = var.IG_name
  }
}

#Elastic IP 
resource "aws_eip" "Example_eip" {

    tags = {
    Name = var.nat_Eastic_Ip
  }
}

#NAT Gateway
resource "aws_nat_gateway" "Example_NAT" {
  allocation_id = aws_eip.Example_eip.id
  subnet_id     = aws_subnet.Example_public_subnet.id

  tags = {
    Name = var.nat_name
  }

  depends_on = [aws_internet_gateway.Example_IGW]
}

#Public Route Table
resource "aws_route_table" "Example_public_RT" {
  vpc_id = aws_vpc.Example_vpc.id

  route {
    cidr_block = var.pub_rt_cidr
    gateway_id = aws_internet_gateway.Example_IGW.id
  }

  tags = {
    Name = var.pub_rt_name
  }
}

#Private Route Table
resource "aws_route_table" "Example_private_RT" {
  vpc_id = aws_vpc.Example_vpc.id

  route {
    cidr_block = var.pvt_rt_cidr
    gateway_id = aws_nat_gateway.Example_NAT.id
  }

  tags = {
    Name = var.pvt_rt_name
  }
}

#Public Route Table Assoccation
resource "aws_route_table_association" "Example_public_RT_ass" {
  subnet_id      = aws_subnet.Example_public_subnet.id
  route_table_id = aws_route_table.Example_public_RT.id
}

#Private Route Table Association
resource "aws_route_table_association" "Example_private_RT_ass" {
  subnet_id      = aws_subnet.Example_private_subnet.id
  route_table_id = aws_route_table.Example_private_RT.id
}


#Security Groups
resource "aws_security_group" "Example_SG" {
  description = "Allow SSH and HTTP traffic for instances"  
  vpc_id      = aws_vpc.Example_vpc.id
    
    ingress {
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

  tags = {
    Name = var.Sg_name
  }
}


#Public Instance
resource "aws_instance" "Example_public_instance" {
  ami           = var.ami_id
  instance_type = var.ins_type
  subnet_id     = aws_subnet.Example_public_subnet.id
  vpc_security_group_ids = [aws_security_group.Example_SG.id]

  tags = {
    Name = var.pub_ins_name
  }

  associate_public_ip_address = true
}

#Private Instance
resource "aws_instance" "Example_private_instance" {
  ami           = var.ami_id
  instance_type = var.ins_type
  subnet_id     = aws_subnet.Example_private_subnet.id

  key_name = var.key_name_ssh

  vpc_security_group_ids = [aws_security_group.Example_SG.id]

  tags = {
    Name = var.pvt_ins_name
  }
  associate_public_ip_address = false
}
