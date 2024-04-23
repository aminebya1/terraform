variable "film_favori" {
  type = string
}

resource "null_resource" "film_writer" {
  provisioner "local-exec" {
    command = "echo ${var.film_favori} > film.txt"
  }
}
