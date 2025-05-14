variable "name" {
    description = "Environment"
    type = string   // string, number, list(string), map, list
    default = "t2.micro"
}

variable "description" {
  description = "Environment"
  type = string
  default = "dev"
}

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