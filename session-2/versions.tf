
terraform {
  required_version = "~> 1.11.0"  // terraform version "1.11.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.96.0"
    }
  }
}



// ~> = lazy constraints

// sementic versioning = "1.11.4"
// 1=Minor (Upgrade) = Breaking changes
// 11=Minor (Update) = Features get added
// 4=Patch (Patch) = Fix bugs, vulnerabilities