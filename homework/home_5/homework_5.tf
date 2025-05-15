
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = merge(local.common_tags, {
    Name = "${var.provider_name}-${var.region}-vpc-${var.business_unit}-${var.tier}-${var.project}-${var.env}"
  })
}



### Step 2: Remote State Sourcing #####
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-session-backend-bucket-0"    # Your actual bucket name
    key    = "homework_4/terraform.tfstate"          # Pointing exactly to homework_4 state file
    region = "us-east-1"
  }
}


############## ALB ###############
resource "aws_security_group" "alb_sg" {
  name        = var.alb_sg_name
  description = "Allow HTTP and HTTPS to ALB"
  vpc_id      = local.vpc_id

  dynamic "ingress" {
    for_each = var.alb_sg_ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.alb_sg_egress
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = merge(local.common_tags, {
    Name = var.alb_sg_name
  })
}

resource "aws_lb" "app" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = local.public_subnet_ids
  security_groups    = [aws_security_group.alb_sg.id]

  tags = merge(local.common_tags, {
    Name = "${var.provider_name}-${var.region}-alb-${var.business_unit}-${var.tier}-${var.project}-${var.env}"
  })
}


############### SG ##############
resource "aws_security_group" "instance_sg" {
  name   = "instance-sg"
  vpc_id = local.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "instance-sg"
  })
}


############## ALB ###############
resource "aws_security_group" "alb_sg" {
  name        = var.alb_sg_name
  description = "Allow HTTP and HTTPS to ALB"
  vpc_id      = local.vpc_id

  dynamic "ingress" {
    for_each = var.alb_sg_ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.alb_sg_egress
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = merge(local.common_tags, {
    Name = var.alb_sg_name
  })
}

resource "aws_lb" "app" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = local.public_subnet_ids
  security_groups    = [aws_security_group.alb_sg.id]

  tags = merge(local.common_tags, {
    Name = "${var.provider_name}-${var.region}-alb-${var.business_unit}-${var.tier}-${var.project}-${var.env}"
  })
}


############### SG ##############
resource "aws_security_group" "instance_sg" {
  name   = "instance-sg"
  vpc_id = local.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "instance-sg"
  })
}


############## LAUNCH TEMPLATE ##################
resource "aws_launch_template" "app" {
  name_prefix   = "app-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.instance_sg.id]
  }

  user_data = base64encode(file("${path.module}/userdata.sh"))

  tag_specifications {
    resource_type = "instance"
    tags = merge(local.common_tags, {
      Name = "${var.provider_name}-${var.region}-instance-${var.business_unit}-${var.tier}-${var.project}-${var.env}"
    })
  }

  tag_specifications {
    resource_type = "volume"
    tags          = local.common_tags
  }
}


############# Auto Scaling Group #############

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity    = var.asg_desired
  max_size            = var.asg_max
  min_size            = var.asg_min
  vpc_zone_identifier = local.private_subnet_ids
  target_group_arns   = [aws_lb_target_group.app.arn]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.provider_name}-${var.region}-asg-${var.business_unit}-${var.tier}-${var.project}-${var.env}"
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = local.common_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}