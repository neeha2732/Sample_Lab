variable "aws_region" {
    description = "Region of the aws provider"
}

variable "vpc_name" {
    description = "Name of the vpc"
}

variable "vpc_cidr_block" {
    description = "CIDR range of vpc"
}

variable "public_sub_name" {
    description = "Name of the public subnet"
}

variable "pub_sub_cidr" {
    description = "CIDR of public subnet"
}

variable "private_sub_name" {
    description = "Name of the private subnet"
}

variable "pvt_sub_cidr" {
    description = "CIDR of private subnet"
}

variable "IG_name" {
    description = "Name of internet gateway"
}

variable "nat_Eastic_Ip" {
    description = "NAT gateway name"
}

variable "nat_name" {
    description = " Name of the nat gateway"
}

variable "pub_rt_name" {
    description = "Name of the public route table"
}

variable "pub_rt_cidr" {
    description = "CIDR of public route table"
}

variable "pvt_rt_name" {
    description = "Name of the private route table"
}

variable "pvt_rt_cidr" {
    description = "CIDR of private route table"
}

variable "Sg_name" {
    description = " Name of the security group"
}

variable "ami_id" {
    description = " ami id "
}

variable "ins_type" {
    description = "Instance type of the instance"
}

variable "pub_ins_name" {
    description = "Name of public instance"
}

variable "pvt_ins_name" {
    description = "Name of private instance"
}

variable "key_name_ssh" {
    description = "Name of the key pair"
}




