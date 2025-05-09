
resource "aws_sqs_queue" "main" {
  name = replace(local.name, "rtype", "sqs")

  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "sqs")
    }
  )
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  identifier = replace(local.name, "rtype", "rds")// RDS instance name
  db_name              = "mydb" # wordpress //database name such as wordpress
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = random_password.main_db_password.result
  parameter_group_name = "default.mysql8.0"
  
  skip_final_snapshot = var.env != "prod" ? true : false
  final_snapshot_identifier = var.env != "prod" ? null : "${var.env}-final snapshot"
  
}

resource "random_password" "main_db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  
}

output "main_db_password" {
  value=random_password.main_db_password.result
  sensitive=true

}
   
#   skip_final_snapshot = true
#   there will not be snapshot

#   skip_final_snapshot = false
#   there will be snapshot

# problem snapshot: i want a snapshot only in prod env but not in Dev,QA, Stage


#  skip_final_snapshot  = false
#   final_snapshot_identifier = "final-snapshot"
# if it is false include this "final_snapshot_identifier = "final-snapshot"" argument


#  skip_final_snapshot  = true
# if it is true do not  include this "final_snapshot_identifier = "final-snapshot"" argument

#  skip_final_snapshot  = true, final_snapshot_identifier = null
# skip_final_snapshot = false,  final_snapshot_identifier = "final-snapshot"


