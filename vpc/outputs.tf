output "vpc_id" {
  value = aws_vpc.app-vpc1.id
}
output "public_subnet_1" {
  value = aws_subnet.public_subnet[*].id
}