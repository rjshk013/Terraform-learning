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

reference : link : https://dzone.com/articles/high-availability-vpc-with-terraform
setup:
-----
Files explanation

1.vpc-main.tf

################ VPC #################
resource "aws_vpc" "main" {
  cidr_block       = "${var.main_vpc_cidr}"

in tags give name for our vpc as main

################# Subnets #############
resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.availability_zone1}"
  
Here we will define 8 subnets with the given cidr blocks in availability two zones (1 & 2)

app-subnet-1
app-subnet-2
elb-subnet-1
elb-subnet-2
db-subnet-1
db-subnet-2
nat-subnet-1
nat-subnet-2

######## IGW ###############
resource "aws_internet_gateway" "main-igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "main-igw"
  }
}

We will atach igw to main vpc
########### NAT ##############
resource "aws_eip" "nat" {
}

resource "aws_nat_gateway" "main-natgw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.subnet8.id}"

  tags = {
    Name = "main-nat"
  }
}

create nat gateway with elastic ip in nat subnet ,subnet 8

-------------------------------------------------------------
2.vpc-variables.tf


variable "aws_access_key" {}  #will define in terraformvars.tf file
variable "aws_secret_key" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "ap-southeast-1" #need to give the region explicitly
}
variable "availability_zone1" {
    description = "Avaialbility Zones" #give the azs
    default = "ap-southeast-1a"
}

variable "availability_zone2" {
    description = "Avaialbility Zones"
    default = "ap-southeast-1b"
}
variable "main_vpc_cidr" {
    description = "CIDR of the VPC" #cidr block of vpc 
    default = "10.0.0.0/16"
}
variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-0c8e97a27be37adfd" #instance id 
}
variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}
variable "key_name" {
  description = "Public key path"
  default     = "vpc-test"  #must be created before the launch,note the region
}
variable "environment_tag" {
  description = "Environment tag"
  default     = "Production"
}
---------------------------------------------

3.ec2-instance.tf

resource "aws_instance" "terraform_wapp" {
    ami = "${var.instance_ami}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_private_sg.id}" ]
    subnet_id     = "${aws_subnet.subnet8.id}"
    key_name               = "${var.key_name}"
    count         = 1
    associate_public_ip_address = true
    tags = {
      Name              = "terraform_ec2_wapp_awsdev"
      "Environment" = var.environment_tag

For ec2 instance launch we must have above variables.edit the count,subnet_id variables depending on which subnet to launch


    }
}
resource "aws_instance" "terraform_web" {
    ami = "${var.instance_ami}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_web_sg.id}" ]
    subnet_id     = "${aws_subnet.subnet1.id}"
    key_name               = "${var.key_name}"
    count         = 1
    associate_public_ip_address = false
    tags = {
      Name              = "web1"
      "Environment" = var.environment_tag


finally check securitygroup.tf file also

