# variables.tf
variable "access_key" {
     default = "AKIAQKQXVCRKNIPKXSWO"

}

variable "secret_key" {
     default = "FBfZ+9g15p5rR73npXet33C8GMTB96m5Jhx8qQrK"

}

variable "region" {
     default = "us-east-1"

}

variable "availabilityZone" {
     default = "us-east-1a"

}

variable "instanceTenancy" {
    default = "default"

}

variable "dnsSupport" {
    default = true

}

variable "dnsHostNames" {
    default = true

}

variable "vpcCIDRblock" {
    default = "10.0.0.0/16"

}

variable "subnetCIDRblock" {
    default = "10.0.1.0/24"

}

variable "destinationCIDRblock" {
    default = "0.0.0.0/0"


}

variable "ingressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]

}
variable "egressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]

}
variable "mapPublicIP" {
    default = true
}# end of variables.tf
