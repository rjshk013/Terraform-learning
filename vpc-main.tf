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

 ################# Subnets #############
# Subnets : public
resource "aws_subnet" "public" {
  count = "${length(var.subnets_cidr)}"
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${element(var.subnets_cidr,count.index)}"
  availability_zone = "${element(var.azs,count.index)}"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_Subnet-${count.index+1}"
  }
}
