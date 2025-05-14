terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket-0"
    key     = "session-7/prod/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}