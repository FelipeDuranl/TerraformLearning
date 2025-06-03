terraform {
  required_providers{
    random = { 
        source = "hashicorp/random" //Tem como principal objetivo gerar valores aleatórios que podem ser usados para criar recursos de forma única e imprevisível
        version = "3.7.2"
    }
  }
}

//Resource vai ser sempre usado para criacao dos recursos
resource "random_string" "random"{
  length = 5 //Tamanho de String
  special = false //Se possui caracter especial
}

//Pode ser usado para gerar senhas seguras
resource "random_password" "password" {
  length = 16
  special = true
}