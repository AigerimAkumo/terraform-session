
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

variable "ingress_ports" {
  description = "a list of ingress"
  type=list(number)
  default = [22,80,443,3306]

  
}

# syntax: element(list, index)
# element([45,65,48,75,29,34], 3)
# > 

# element([45,65,48,75,29,34], 3)
# > 34

variable "ingress_cidr" {
  
  description = "ip"
  type=list(string)
  default = [ "10.0.0.0/16", "0.0.0.0/0", "0.0.0.0/0" ,"10.0.0.0/16"]
}