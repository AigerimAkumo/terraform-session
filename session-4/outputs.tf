
output "aws_instance_public_ip" {
    value = aws_instance.first_ec2[*].public_ip
    description = "AWS DESCRIPTION"
  
}
