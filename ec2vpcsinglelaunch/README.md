# AWS-Terraform

You can create vpc,public & private subnets,security groups and launch ec2 instances using this files.
just clone this repo and edit aws credentials in terraform.tfvars accordingly & run 

terraform init 

terraform plan -var-file terraform.tfvars

terraform apply -var-file terraform.tfvars
------------------------------------------------------------
Features:

Instances have Name with envioronment values
