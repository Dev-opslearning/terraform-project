variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.3.0/24"
}
variable "route1_cidr_block" {
  description = "CIDR block for the route"
  type        = string
  default     = "0.0.0.0/0"
}
variable "route2_cidr_block" {
  description = "CIDR block for the route"
  type        = string
  default     = "0.0.0.0/0"
}
variable "egress_cidr" {
  description = "CIDR block for egress_outbound-rule"
  type        = string
  default     = "0.0.0.0/0"
  
}

