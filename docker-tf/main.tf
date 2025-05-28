// hey this is my alta3 lab tf file
/*
i
aliased
terraform
to
tf
cause
im 
lazy
and 
keep
typing
terrafrom
for
some
reason
*/
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {} # comon zach tell me the hack to not put this here

resource "docker_image" "nginx" {
  name         = "nginx:1.19.6"
  keep_locally = true       // keep image after "destroy"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  network_mode = "bridge"
  name  = "tutorial"
  ports {
    internal = 80
    external = 2224
  }
}
