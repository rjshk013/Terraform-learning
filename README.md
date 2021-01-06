# Terraform-learning

ec2vpcsinglelaunch
------------------
clone the repo 

edit your aws credentials in terraform.tfvars

This will create a vpc as per the given values in vpc-main.tf & vpc-variables.tf

This will create ec2 instance from ec2instance.tf


terraform init

terraform plan -var-file terraform.tfvars

terraform apply -var-file terraform.tfvars
