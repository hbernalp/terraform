#Realizando el llamado de la llave ssh desde un archivo especifico

resource "aws_key_pair" "key_class1" {
    key_name = "class-key1"
    public_key = "${file("class_key.pem.pub")}"
  
}
