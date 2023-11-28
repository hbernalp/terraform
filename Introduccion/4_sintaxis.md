### Estructura de sintaxis para crear servicios de AWS
siempre que se va a iniciar la creacion de un servicio de AWS en terraform se debe nombrar el provider, la estructura es la siguiente:

        provider "aws" {
            region = "eu-west-1"
        }
 Esta instruccion valida el proveedor en el que vamos a trabajar, en este caso AWS, y especifica la region donde esta creada la LandingZone que va a contener los servicios.

 Para crear cada uno de los servicios, se hace uso de un resourse, la estructura es la siguiente:

        # Creando una VPC
            resource "aws_vpc" "main" {
                cidr_block       = "10.0.0.0/16"
                instance_tenancy = "default"

                tags = {
                    Name = "main"
                }
            }   

        Siempre lo primero que se crea en una VPC ya que es desde donde inicia todo el servicio en el Cloud.


Es importante tener en cuenta que para crear cualquiera de los servicios, es necesario hacer uso de la documentacion de Terraform, teniendo en cuenta el recurso a crear

        Ejemplo para crear una vpc: 
        https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc.html

        Otro Ejemplo con EC2

        # Creando un EC2
        resource "aws_instance" "test" {
            ami = "ami-0694d931cee176e7d"
            instance_type = "t2.micro"
        }
