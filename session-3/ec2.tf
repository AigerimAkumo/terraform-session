
resource "aws_instance" "first_ec2" {
  count = 5 //meta-argument
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


# Reference to Resource
# Syntax: first_label.second_label.attribute    //attribute after creation
# Ex: aws_security_group.simple_sg.id


# Reference t o Input variable
# Syntax: var.variable_name
# Ex: var.instance.type

# Reference to Data Source
# Syntax: data.first_label.second_label.attribute
# ex: data.aws_ami.amazon_linux_2023.id



resource "aws_security_group" "simple_sg" {
  name        = "simple-sg"
  description = "this is a test simple-sg"

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
    protocol    = "-1" #means all protocls
    cidr_blocks = ["0.0.0.0/0"]
  }
}
