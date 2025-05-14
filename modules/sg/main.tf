
resource "aws_security_group" "simple_sg" {
  name        = var.name
  description = var.description


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