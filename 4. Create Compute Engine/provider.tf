terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.1"
    }
  }
}

provider "google" {
  project = "terraform-project-378317"
  region = "europe-west3"
  zone = "europe-west3-a"
  credentials = "../key.json"
}