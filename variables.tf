
variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}

variable "subnets_cidr" {
	type = "list"
	default = ["10.20.1.0/24", "10.20.2.0/24","10.20.3.0/24" ]
}

variable "azs" {
	type = "list"
	default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "main_vpc_cidr" {
    description = "CIDR of the VPC"
    default = "10.20.0.0/16"
}

