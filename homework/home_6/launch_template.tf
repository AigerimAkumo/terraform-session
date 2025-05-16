data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_launch_template" "app_lt" {
  name_prefix   = "app-lt-"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.ec2_sg.id]
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
  )

  tags = local.common_tags
}
