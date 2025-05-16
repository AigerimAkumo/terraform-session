
terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket-0"
    key     = "terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
    workspace_key_prefix = "workspaces"

  }
}

// Each wokspace will have its own terraform wokspace 
# in s3 bucket 
# syntax: workspace_key_prefix/
# workspace/workspace_name/terraform.tfstate