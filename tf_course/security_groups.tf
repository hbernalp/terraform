resource "aws_security_group" "sg-1" {
    name = "sg_ping_ssh"
    vpc_id = "${aws_vpc.main1.id}"
    description = "Permitir ping y SSH"

    ingress {
        description = "permitir servicio ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "permitir servicio ping"
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh_ping"
  }

  
}

resource "aws_security_group" "sg-2" {
    name = "sg_HTTP_Permit"
    vpc_id = "${aws_vpc.main1.id}"
    description = "Permitir HTTP"

    ingress {
        description = "permitir servicio http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "permitir servicio http"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Acceso HTTP"
  }

  
}