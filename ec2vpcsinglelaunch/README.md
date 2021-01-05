# AWS-Terraform

You can create vpc,public & private subnets,security groups and launch ec2 instances using this files.
just clone this repo and edit aws credentials in terraform.tfvars accordingly & run 

make sure the files have user permissions.if the files have root ownership you wil get error :
Error: Failed to install provider

Error while installing hashicorp/aws v3.22.0: mkdir .terraform: permission
denied

Fix this after pulling check the folder & file permission & ownership

terraform init 

terraform plan -var-file terraform.tfvars

terraform apply -var-file terraform.tfvars

Features:

Instances will have Name with envioronment values
