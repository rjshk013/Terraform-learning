## Create VPC ##
################ VPC #################
resource "aws_vpc" "main" {
  cidr_block       = "${var.main_vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

output "aws_vpc_id" {
  value = "${aws_vpc.main.id}"
}

## Create Subnets ##
resource "aws_subnet" "publicsub1" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "192.168.0.0/22"
  availability_zone = "${var.availability_zone1}"


  tags = {
    Name = "app-subnet-1"
    }
}
output "aws_subnet_publicsub1" {
  value = "${aws_subnet.publicsub1.id}"
}
