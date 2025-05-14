variable "instance_type" {
    description = "aws instance size or type"
    type = string // string, number, boolean, list(string), map 
    default = "t2.micro"
}
variable "env" {
    description = "environmnet"
    type = string
    default = "dev"
}
variable "ami" {
    description = "AMI id"
    type = string
    default = "xyz"
}
variable "vpc_security_group_ids" {
    description = "security group id"
    type = list(string)
    default = [ "xyz" ]
}