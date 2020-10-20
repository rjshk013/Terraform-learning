# Variables
variable "access_key" {
  default = "AKIAQKQXVCRKNIPKXSWO"
}
variable "secret_key" {
  default = "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"
}
variable "region" {
  default = "us-east-1"
}
variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default     = "10.1.0.0/24"
}
variable "availability_zone" {
  description = "availability zone to create subnet"
  default     = "us-east-1a"
}
variable "keyName" {
  description = "Public key path"
  default     = "testebs"
}
variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default     = "ami-0947d2ba12ee1ff75"
}
variable "instance_type" {
  description = "type for aws EC2 instance"
  default     = "t2.micro"
}
variable "environment_tag" {
  description = "Environment tag"
  default     = "Production"
}
