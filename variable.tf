variable "vpc_cidr_block" {
        description = "CIDR block for the VPC"
        type        = string
}

variable "private_subnet_cidr" {
        description = "CIDR block for the private subnet"
        type        = string
}

variable "public_subnet_cidr" {
        description = "CIDR block for the public subnet"
        type        = string
}
variable "route1_cidr_block" {
        description = "CIDR block for the route"
        type        = string
}
variable "route2_cidr_block" {
        description = "CIDR block for the route"
        type        = string
}
variable "egress_cidr" {
        description = "CIDR block for egress_outbound-rule"
        type        = list(string)  
}
variable "instance_type" {
        description = "type of insance for ec2"
        type = string
}

variable "environment_name" {
        description = "name for instance"
        type = string
}

variable "resource_name" {
    description = "to name aws_resources"
    type = string
}


