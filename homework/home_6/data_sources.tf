data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-session-backend-bucket-0"    
    key    = "home_4/terraform.tfstate"
    region = "us-west-2"           
  }
}




#   backend = "local" //remote
#   config = {
#     path = "../home_4/terraform.tfstate"
# }
# }

