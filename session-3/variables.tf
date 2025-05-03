
variable "instance_type" {
    description = "aws instance size of type"
    type = string   // string, number, list(string), map, list
    default = "t2.micro"
}

variable "env" {
  description = "Environment"
  type = string
  default = "qa"
}