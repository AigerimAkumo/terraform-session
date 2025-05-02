



resource "aws_instance" "first_ec2" {
  ami           = "ami-07b0c09aab6e66ee9" # argument
  instance_type = "t2.micro"
  tags = {
    Name        = "aws-session2-instance"
    Environment = "dev"
  }
}

resource "aws_instance" "second_ec2" {
  ami           = "ami-07b0c09aab6e66ee9" # argument
  instance_type = "t2.micro"
  tags = {
    Name        = "aws-session2-instance"
    Environment = "dev"
  }
}


resource "aws_security_group" "simple_sg" {
  name = "simple-sg"
  description = "this is a test simple-sg "

  ingress {

    from_port       = 22    // Number does not use ""
    to_port         = 22
    protocol        = "tcp"  // everything inside "" string
    cidr_blocks = ["0.0.0.0/0"] // List of String block"S"
  
  }
  egress {
    
    from_port       = 0
    to_port         = 0
    protocol        = "-1"  // tcp,udp,icmp
    cidr_blocks = ["0.0.0.0/0"]
  }

  
}


# Block and Argument

# Interpolation
# Blocks:
# resource and source
# resource block = create and manage resources
# resource block has 2 labels = first_label, second_label

# FIRST_LABEL = indicates the resource that you want to create or manage, defined by HashiCorp
# SECOND_LABEL = indicates the logical name or logical ID for your Terraform resource, 
# unique withing your working directory, defined by us.
# Argument = configuration of your resource, key=value
# Attributes = are known after creation (arn, instance ID,etc)

