terraform {
  backend "s3" {
    bucket = "my-bucket-terraform"
    key = "key/terraform.tfstate"
    region = "us-east-1"
    
  }
}
provider "aws" {
  region = "us-east-1"

}
resource "aws_instance" "private_ec2" {
  ami           = "ami-053b0d53c279acc90"
  key_name      = "ec2-keypair"
  instance_type = var.instance_type
  tags = {
    Environment = var.environment_name
    Name = "${var.resource_name}_instance"
}  
  
}  