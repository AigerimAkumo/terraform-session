resource "aws_instance" "first_ec2" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"
  tags = {
    Name        = "session-9"
    Environment = "dev"
    # Engineer = "1"
    # Engineer = "2"
  }
}
variable "env" {}
  


// Fetch Amazon Linux 2023 AMI ID
data "aws_ami" "amazon_linux_2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.7.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_sqs_queue" "main" {
    name = "session-9-sqs"
  
}
# resource "aws_sqs_queue" "main" {
#     name = "session-9-sqs"
  
# }

