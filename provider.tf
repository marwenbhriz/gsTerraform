terraform {
  required_version = ">=0.1"
  required_providers {
    tls = {
      source = "hashicorp/tls"
    }
    google-beta = {
      source = "hashicorp/google-beta"
      version = "~>4"
    }
  }
}

provider "google" {
  #credentials = file("../credentials.json")
  region = var.accounts.region
  project = var.accounts.project
}

#provider "kubernetes" {
#  host                   = module.gke.host
#  cluster_ca_certificate = base64decode(module.gke.cluster_ca_certificate)
#  token                  = module.gke.token
  #config_path    = "~/.kube/config"
#}
