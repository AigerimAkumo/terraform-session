terraform {
  backend "s3" {
    bucket         = "terraform-session-backend-bucket-0"
    key            = "home_4/terraform.tfstate"
    region         = "us-west-2"
  }
}
