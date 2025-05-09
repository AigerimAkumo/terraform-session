
resource "aws_instance" "first_ec2" {
  ami           = "ami-07b0c09aab6e66ee9" # argument
  instance_type = "t2.micro"
  tags = {
    Name        = "my_instance"
    Environment = "dev"
  }

}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}