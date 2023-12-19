provider "aws" {
    region = "eu-west-1"
  
}

#Resource para testear la conexion a AWS
#Crea una instancia EC2
# resource "aws_instance" "test" {
#     ami = "ami-0694d931cee176e7d"
#     instance_type = "t2.micro"
  
# }

#Crearndo una VPC
resource "aws_vpc" "main1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
   enable_dns_hostnames = true

  tags = {
    Name = "main VPC 1"   
    
  }
}

#Creando una subnet
resource "aws_subnet" "subnet1" {
  vpc_id = "${aws_vpc.main1.id}"
  cidr_block = "10.0.10.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-1a"

  tags ={
    Name = "subnet 1 en eu-west-1a main1"

  }
}

resource "aws_subnet" "subnet2" {
  vpc_id = "${aws_vpc.main1.id}"
  cidr_block = "10.0.20.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-1b"

  tags ={
    Name = "subnet 1 en eu-west-1b main1"

  }
}

resource "aws_subnet" "subnet3" {
  vpc_id = "${aws_vpc.main1.id}"
  cidr_block = "10.0.30.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-1c"

  tags ={
    Name = "subnet 1 en eu-west-1c main1"

  }
}


 #Creando en internet gateway con la route table
 resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main1.id}"

  tags = {
    Name ="Internet Gateway Main"

  } 
 }

 resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.main1.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"

  }  
  tags = {
    Name = "Route Table main"
  }
 }

 #Asociando la subnet al route table
 resource "aws_route_table_association" "table_subnet1" {
  subnet_id = "${aws_subnet.subnet1.id}"
  route_table_id = "${aws_route_table.rt.id}"
   
 }

  resource "aws_route_table_association" "table_subnet2" {
  subnet_id = "${aws_subnet.subnet2.id}"
  route_table_id = "${aws_route_table.rt.id}"
   
 }

  resource "aws_route_table_association" "table_subnet3" {
  subnet_id = "${aws_subnet.subnet3.id}"
  route_table_id = "${aws_route_table.rt.id}"
   
 }

