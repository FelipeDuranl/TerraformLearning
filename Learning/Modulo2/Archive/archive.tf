terraform {
  required_providers {
    archive = {
      source  = "hashicorp/archive" //Pode ser usado para trabalhar com arquivos e pastas
      version = "2.7.1"
    }
    random = {
        source = "hashicorp/random"
        version = "3.7.2"
    }
  }
}

resource "random_string" "suffixname" {
  length = 8
  special = false
}

data "archive_file" "filezip" {
  type        = "zip"
  source_dir  = "data_backup" //De onde esta vindo o data
  output_path = "backup-${random_string.suffixname.result}.zip"  //Para onde vai o data
}

output "fileziped" { //Usado para output da infra
  value = "The file was ${data.archive_file.filezip.source_dir} to ${data.archive_file.filezip.output_path} that have ${data.archive_file.filezip.output_size}KB, name = ${data.archive_file.filezip.output_path}"
}