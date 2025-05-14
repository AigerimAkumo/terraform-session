variable "instance_type" {
    description = "instance_type"
    type = string   
    default = "t2.micro"
}

variable "env" {
  description = "Environment"
  type = string
  default = "dev"
}

variable "ami" {
  description = "a list of ingress"
  type= string
  default = "xuyZ"
}
variable "vpc_security_group_ids" {
  description = "a list of ingress"
  type=list(number)
  default = [ 22 ]

  
}