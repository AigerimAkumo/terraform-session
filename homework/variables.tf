

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