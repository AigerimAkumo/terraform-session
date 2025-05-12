

variable "instance_type" {
    description = "aws instance size of type"
    type = string   // string, number, list(string), map, list
    default = "t2.micro"
}

variable "env" {
  description = "Environment"
  type = string
  default = "dev"
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}