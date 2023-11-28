### Instalando Terraform en Linux
Para la instalacion de Terraform en Linux se deberan tener los siguientes datos
1. terraform.io -> va donde se hacen las descargas, y se copia la url de la descarga de 64 bits de linux

2. en una terminal se crea una carpeta donde se va a instalar terraform 

        -> mkdir tf_install

3. se ingresa al directorio creado tf_install y con la url que se copio del archivo de descarga se hace la instalación de la siguiente forma:

        -> wget https://releases.hashicorp.com/terraform/1.6.4/terraform_1.6.4_linux_amd64.zip

4. se debe agregar el PATH de donde se ejecuta el terraform para no estar colocando siempre la palabra Terraform al ejecutar un comando

        -> estando en la carpeta tf_install digitar pwd

        -> saldra la ruta de la configuracion del path de Terraform -> /home/harrisson.bernal/tf_install, se copia este path

        -> se abre el bashrc -> nano ~/.bashrc 
            al final del archivo se agrega la siguiente instruccion:

                # Add PATH Terraform
                export PATH="$PATH:/home/harrisson.bernal/tf_install"

            guarda los cambios
        
        -> hacer source ~/.bashrc -> esto hace que se refresque la configuracion de comandos de Linux

    Ya puede ejecutar terraform sin anteponer la palabra terraform


