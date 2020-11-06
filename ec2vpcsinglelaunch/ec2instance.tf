resource "aws_instance" "terraform_wapp" {
    ami = "${var.instance_ami}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_private_sg.id}" ]
    subnet_id     = "${aws_subnet.subnet8.id}"
    key_name               = "vpc-test"
    count         = 1
    associate_public_ip_address = true
    tags = {
      Name              = "terraform_ec2_wapp_awsdev"
      Environment       = "development"
      Project           = "DEMO-TERRAFORM"
    }
}
resource "aws_instance" "terraform_web" {
    ami = "${var.instance_ami}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_web_sg.id}" ]
    subnet_id     = "${aws_subnet.subnet1.id}"
    key_name               = "vpc-test"
    count         = 1
    associate_public_ip_address = false
    tags = {
      Name              = "terraform_ec2_web"
      Environment       = "development"
      Project           = "DEMO-TERRAFORM"
    }
}

