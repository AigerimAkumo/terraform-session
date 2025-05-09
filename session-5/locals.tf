
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


locals{
    # Naming standard
    name = "${var.provider_name}-${var.region}-rtype-${var.business_unit}-${var.tier}-${var.project}-${var.env}"


# Tagging standard
    common_tags = {
        Environment = var.env
        Project_Name = var.project
        business_unit = var.business_unit
        Team = var.team
        Owner = var.owner
        Managed_By = var.managed_by
        Market  ="us"
    
    }
}