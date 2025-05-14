variable "name" {
   description = "Environmnet"
   type = string
   default = "test-sg"
}

variable "description" {
  default = "test-sg"
  type = string
  description = "This is a description for sg"
}

variable "ingress_ports" {
    description = "a list of ingress ports"
    type = list(number)
    default = [ 22, 80, 443, 3306 ]
}

variable "ingress_cidr" {
    description = "a list of ingress ports"
    type = list(string)
    default = [ "10.0.0.0/16", "0.0.0.0/0", "0.0.0.0/0", "10.0.0.0/16" ]
}