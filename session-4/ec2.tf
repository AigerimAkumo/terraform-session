
resource "aws_instance" "first_ec2" {
  count = 5      //meta-argument
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type

  tags = {
    Name = "${var.env}-instance"  // dev-instance, qa-instance, stage-instance, prod-instance
    // Name2 = format("%s-instance",var.env)
    Environment = var.env
  }

  vpc_security_group_ids = [aws_security_group.simple_sg.id]
  user_data = templatefile("userdata.sh", { environment =  var.env })

}



resource "aws_security_group" "simple_sg" {
  name        = "${var.env}-instance-sg"
  description = "this is a test simple-sg"


# Terraform Dynamic Block

}
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  count = length(var.ingress_ports)
  security_group_id = aws_security_group.simple_sg.id
  cidr_ipv4         = element(var.ingress_cidr, count.index)
  from_port         = element(var.ingress_ports, count.index)
  ip_protocol       = "tcp"
  to_port           = var.ingress_ports[count.index]
}

// 22, 80, 443
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.simple_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



# count=3
# count[index]
