
# output "aws_instance_public_ip" {
#   value = aws_subnet.public[*]
#   description = "AWS EC2 instance public IP address"
# }



# // Include outputs.tf file to output vpc_id, public_subnet_ids, private_subnet_ids


# # Output the VPC ID
# output "vpc_id" {
#   description = "The ID of the VPC"
#   value       = aws_vpc.main_vpc.id
# }

# # Output Public Subnet IDs
# output "public_subnet_ids" {
#   description = "List of public subnet IDs"
#   value       = aws_subnet.public[*].id
# }

# # Output Private Subnet IDs
# output "private_subnet_ids" {
#   description = "List of private subnet IDs"
#   value       = aws_subnet.private[*].id
# }

# Output the VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main_vpc.id
}

# Output Public Subnet IDs
output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id
}

# Output Private Subnet IDs
output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id
}

# Output EC2 instance public IP
output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.main.public_ip
}
