
resource "aws_sqs_queue" "count_queue" {
    count = length(var.names)
    name = element(var.names, count.index)
}

variable "names" {
    type = list(string)
    description = "a list aws sqs names"
    default = ["first", "second", "third"]
}


// until Terraform  0.13, we used element
// this code block creates 3 aws sqs. name are first, second, third
// element function is limited to A LIST

// Problem statement: what if i have a map
// only autoscaling group in aws does  not taking map