
######## Root Module ##########

module "sg" {
    source = "../../modules/sg" // Where the child module is. When you call child module locally, you use the path
########## variables ############
    name = "dev-instance-sg"
    description = "this a sg for dev instance"
    ingress_ports = [ 22 ]
    ingress_cidr =  [ "10.0.0.0/32" ]
}

module "ec2" {
    source = "../../modules/ec2"
########## variables #############
    env = "dev"
    instance_type = "t2.micro"
    ami = data.aws_ami.amazon_linux_2023.id  // Reference to Data Source
    vpc_security_group_ids = [ module.sg.security_group_id ]  // Reference to Child Module Output // Syntax: module.module_name.output
}

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

########### Calling Terraform Modules Remotely ##########
// Terraform Registry - Offical Child Module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"    // Terraform Registry

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "erkin_sg" {
    source = "github.com/Ekanomics/terraform-session//modules/sg"
    name = "erkin-sg"
    description = "this a sg for dev instance"
    ingress_ports = [ 22 ]
    ingress_cidr =  [ "10.0.0.0/32" ]
}