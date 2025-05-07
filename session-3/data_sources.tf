
// Fetch amazon linux 2023 IAM ID
data "aws_ami" "amazon_linux_2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.7*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}




# data "template_file" "user_data" {
#   template = file("userdata.sh")
#   vars = {
#     environment = var.env
#     # varibale in bash = variable in terraform
#   }
# }

# newer version :

