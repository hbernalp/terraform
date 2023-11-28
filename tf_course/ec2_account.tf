provider "aws" {
    region = "eu-west-1"
  
}

#Resource para testear la conexion a AWS
#Crea una instancia EC2
# resource "aws_instance" "test" {
#     ami = "ami-0694d931cee176e7d"
#     instance_type = "t2.micro"
  
# }

resource "aws_vpc" "main1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main1"
    
  }
}