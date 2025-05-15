variable "instance_type" {
    description = "aws instance size of type"
    type = string   
    default = "t2.micro"
}

variable "env" {
  description = "Environment"
  type = string
  default = "dev"
}


# variable "env" {
#   description = "Environment"
#   type = string
#   default = "dev"
# }



variable "ingress_ports" {
  description = "a list of ingress"
  type=list(number)
  default = [22,80,443,3306]

  
}

variable "ingress_cidr" {
  
  description = "ip"
  type=list(string)
  default = [ "10.0.0.0/16", "0.0.0.0/0", "0.0.0.0/0" ,"10.0.0.0/16"]
}



variable "public_subnet_azs" {
  description = "Availability zones for public subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}


variable "private_subnet_azs" {
  description = "Availability zones for private subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}



variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}


variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}


####### ALB ############

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "alb_sg_name" {
  description = "Name for ALB Security Group"
  type        = string
  default     = "alb-sg"
}

variable "alb_name" {
  description = "Name for ALB"
  type        = string
  default     = "app-alb"
}

variable "alb_tg_name" {
  description = "Name for ALB Target Group"
  type        = string
  default     = "app-tg"
}

variable "alb_sg_ingress" {
  description = "List of ingress rules for ALB SG"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "alb_sg_egress" {
  description = "List of egress rules for ALB SG"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}




variable "resource_type" {
  description = "Type of the resource like vpc, sg, alb, etc."
  type        = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "alb_sg_id" {
  type = string
}

variable "asg_min" {
  type    = number
  default = 1
}

variable "asg_max" {
  type    = number
  default = 3
}

variable "asg_desired" {
  type    = number
  default = 2
}


variable "env" {
  description = "Environmnet"
  type        = string
  default     = "dev"
}
variable "provider_name" {
  description = "Provider"
  type        = string
  default     = "aws"
}
variable "business_unit" {
  description = "Business Unit"
  type        = string
  default     = "orders"
}

variable "region" {
  description = "Provider Region Name"
  type        = string
  default     = "usw2"
}

variable "project" {
  description = "Project Name"
  type        = string
  default     = "tom"
}

variable "tier" {
  description = "Application tier"
  type        = string
  default     = "db"
}
variable "team" {
  description = "Team Name"
  type        = string
  default     = "devops"
}
variable "owner" {
  description = "Resource Owner"
  type        = string
  default     = "aigerim"
}
variable "managed_by" {
  description = "Tool"
  type        = string
  default     = "terraform"
}