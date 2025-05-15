# backend.tf = "This is where I keep my blueprints."
# terraform_remote_state = "Can you show me your blueprints from another project?"
terraform {
  backend "s3" {
    bucket         = "terraform-session-backend-bucket-0"
    key            = "homework_4/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    
  }
}