
# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main-vpc"
  }
}

# Public Subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnet_azs)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.public_subnet_azs[count.index]
  map_public_ip_on_launch = true
  tags = { Name = "public-${count.index + 1 }"
}

}
# Private Subnets
resource "aws_subnet" "private" {
  count = length(var.private_subnet_azs)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.private_subnet_azs[count.index]
  tags = { Name = "private-${count.index + 1 }"
}
}

# Internet Gateway
resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main-igw"
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# NAT Gateway in public subnet
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "gw-NAT"
  }

# we need depends_on because Internet gateway will created before NAT gateway
  depends_on = [aws_internet_gateway.internet_gw]
}

# Public Route Table
resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  tags = {
    Name = "public-rtb"
  }
}

# Private Route Table
resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "private-rtb"
  }
}

# Route Table Associations
resource "aws_route_table_association" "public_assoc" {   // public
   count = 3
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rtb.id
}

# resource "aws_route_table_association" "public2_assoc" {
#   subnet_id      = aws_subnet.public2.id
#   route_table_id = aws_route_table.public_rtb.id
# }

# resource "aws_route_table_association" "public3_assoc" {
#   subnet_id      = aws_subnet.public3.id
#   route_table_id = aws_route_table.public_rtb.id
# }

resource "aws_route_table_association" "private_assoc" {  // private
  count = 3
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rtb.id
}

# resource "aws_route_table_association" "private2_assoc" {
#   subnet_id      = aws_subnet.private2.id
#   route_table_id = aws_route_table.private_rtb.id
# }

# resource "aws_route_table_association" "private3_assoc" {
#   subnet_id      = aws_subnet.private3.id
#   route_table_id = aws_route_table.private_rtb.id
# }

# Security Group
resource "aws_security_group" "sg_ec2" {
  name        = "homework-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "homework-sg"
  }
}

# EC2 Instance
resource "aws_instance" "main" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public[0].id
  associate_public_ip_address = true
  key_name                    = "myLaptopKey" 
  vpc_security_group_ids      = [aws_security_group.sg_ec2.id]

  tags = {
    Name        = "${var.env}-instance"
    Name2       = format("%s-instance", var.env)
    Environment = var.env
  }
}
