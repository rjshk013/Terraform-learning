variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "ap-southeast-1"
}
variable "availability_zone1" {
    description = "Avaialbility Zones"
    default = "ap-southeast-1a"
}

variable "availability_zone2" {
    description = "Avaialbility Zones"
    default = "ap-southeast-1b"
}
variable "main_vpc_cidr" {
    description = "CIDR of the VPC"
    default = "10.0.0.0/16"
}
variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-0c8e97a27be37adfd"
}
variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}
