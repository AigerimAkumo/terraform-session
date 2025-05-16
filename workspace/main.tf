
resource "aws_sqs_queue" "main" {
  
   name = "${terraform.workspace}-sqs"
}

// how to reference to wokspace:terraform.wokspace?
// terraform.workspace = current workspace name


  
