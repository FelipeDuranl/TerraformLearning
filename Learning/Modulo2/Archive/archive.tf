terraform{
    required_providers{
        archive = {
            source = "hashicorp/archive" //Pode ser usado para trabalhar com arquivos e pastas
            version = "2.7.1"
        }
    }
}

data "archive_file" "filezip"{
    type = "zip"
    source_file = "data_backup/data.txt" //De onde esta vindo o data
    output_path = "backup.zip" //Para onde vai o data
}

output "fileziped" { //Usado para output da infra
  value = "The file was ${data.archive_file.filezip.source_file} to ${data.archive_file.filezip.output_path} that have ${data.archive_file.filezip.output_size}KB" 
}