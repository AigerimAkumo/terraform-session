terraform {
  backend "s3" {
    bucket         = "terraform-session-backend-bucket-0"
    key            = "session-9/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamo_table = "terraform-state-locking"
    
  }
}