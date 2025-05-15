
#  Naming Convention: Naming Standard

# 1. Provider Name: aws, azure, gcp, do, alibaba
# 2. Region: usw1, usw2,use1,use2
# 3. Resource Type: ec2, s3, sqs, asg, alb, efs
# 4. Environmnet: dev, qq, stg, prd
# 5. Business Unit: orders, payments, streaming
# 6. Project Name: unicorn, batman, tom, jerry, ihop, ipa
# 7. Tier: frontend, backend, db


# Example 1: aws-usw2-vpc-orders-db-tom-dev

# Tagging Convention: Tagging Standard

# tagging standard: common tags

# 1.Environmnet: dev, qq, stg, prd
# 2. Project Name: unicorn, batman, tom, jerry
# 5. Business Unit: orders, payments, streaming
# 4. Team: devops, DRE, SRE, security
# 5. Owner: aigerim@gmail.common
# 6. Managed_By: cloudformation,terrfaorm,python,maual
# 7. Lead: akmal@akumo@gmail.com


variable "env" {
  description = "Environmnet"
  type        = string
  default     = "dev"
}
variable "provider_name" {
  description = "Provider"
  type        = string
  default     = "aws"
}
variable "business_unit" {
  description = "Business Unit"
  type        = string
  default     = "orders"
}

variable "region" {
  description = "Provider Region Name"
  type        = string
  default     = "usw2"
}

variable "project" {
  description = "Project Name"
  type        = string
  default     = "tom"
}

variable "tier" {
  description = "Application tier"
  type        = string
  default     = "db"
}
variable "team" {
  description = "Team Name"
  type        = string
  default     = "devops"
}
variable "owner" {
  description = "Resource Owner"
  type        = string
  default     = "kris"
}
variable "managed_by" {
  description = "Tool"
  type        = string
  default     = "terraform"
}