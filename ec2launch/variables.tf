variable "access_key" {
 default = "AKIAQKQXVCRKNIPKXSWO"
}
variable "secret_key" {
        default = "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"
}
variable "region" {
        default = "us-east-1"
}
variable "availabilityZone" {
        default = "us-east-1a"
}
variable "instanceType" {
        default = "t2.micro"
}
variable "keyName" {
        default = "testebs"
}
variable "subnet" {
        default = "subnet-0ceb7e1b1f3164745"
}
variable "securityGroups" {
        type = list
        default = [ "sg-0b2aefd7600766c8c" ]
}
variable "instanceName" {
 
      default = "webserver"
}
variable "amis" {
    default = {
        "us-east-1" = "ami-0947d2ba12ee1ff75"
    }
}# end of variables.tf
