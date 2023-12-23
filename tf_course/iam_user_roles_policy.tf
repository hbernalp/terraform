#Este archivo va a estar completamente en comentario ya que no es necesario que este activo cada vez que se ejecuta el terraform
#Creacion de usuarios, politicas y roles de IAM - AWS

resource "aws_iam_group" "administradores" {
    name = "Administradores"
  
}

resource "aws_iam_policy_attachment" "admins-attach" {
    name = "Admins-Attach"
    groups = [ "${aws_iam_group.administradores.name}" ]
    policy_arn = "arn:aws:iam::policy/job-function/SystemAdministrator"
  
}

resource "aws_iam_user" "admin1" {
    name = "admin1"
  
}

resource "aws_iam_user" "admin2" {
    name = "admin2"
  
}

#Agregando los usuarios al grupo creado anteriormente

resource "aws_iam_group_membership" "admins-users" {
    name = "admins_users"
    users = [
        "${aws_iam_user_admin1.name}",
        "${aws_iam_user_admin2.name}",
    ]
    group = aws_iam_group.administradores
  
}