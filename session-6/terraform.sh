
#! /bin/bash

rm -rf .terraform*
read -p "which env you wanna choose?"
$echo -i "s/_env_/$ENV/g" backend.tf 

echo "env is set to $ENV"

terraform init
terraform apply -var-file=$ENV.tfvars

echo "rolling back to static string"
sed -i "s/_env_/$ENV/g" backend.tf 

echo "infra was deployed successfully to $ENV envorinment"