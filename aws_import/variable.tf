variable "name" {
    description = "this is the tag for the ec2"
    type = string
    default = "GaryWasHere"
}

variable "region" {
    description = "ec2 runs in this region of aws"
    type = string
    default = "ca-central-1"
}

variable "ami" {
    description = "image of the os"
    type = string
    default = "ami-05265d002dc5e38d6" #https://cloud-images.ubuntu.com/locator/ec2/
}

variable "instance_type" {
    description = "type of the ec2 machine"
    type = string
    default = "t2.micro"
}