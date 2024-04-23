variable "movies_name" {
    type= map(string)
    default = {
        "film1" = "Inception",  
        "film2"="Interstellar",
        "film3"="The Matrix" 
    }
}

resource "null_resource" "create_movies_file" {
  provisioner "local-exec" {   
     command = join(" && ", [for key, value in var.movies_name : "echo ${key} - ${value} >> Movies.txt"])
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}

output "confirmation" {
  value       = "Fichier Movies.txt créé avec les films et leurs noms."
}
