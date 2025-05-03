
resource "aws_instance" "first_ec2" {
  ami           = "ami-07b0c09aab6e66ee9"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.simple_sg.id]

  tags = {
    Name = "my-terraform-webserver"
  }

  user_data = <<-EOF
              #!/bin/bash
              dnf install -y httpd
              systemctl enable httpd
              systemctl strtyuil;'
              art httpd
              echo "<html><body><h1>Session-2 homework is complete! </h1></body></html>" > /var/www/html/index.html
              EOF
}

resource "aws_security_group" "simple_sg" {
  name        = "simple-sg"
  description = "this is a test simple-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
