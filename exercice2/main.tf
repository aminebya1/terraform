variable "movie_name" {
  description = "Le nom du film préféré"
  type        = string
}

resource "null_resource" "create_movie_file" {
  provisioner "local-exec" {
    command = "echo ${var.movie_name} > film.txt"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

output "confirmation" {
  description = "Message de confirmation de la création du fichier film.txt"
  value       = "Fichier film.txt créé avec le nom du film: ${var.movie_name}"
}
