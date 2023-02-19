provider "google" {
  project = "terraform-project-378317"
  region = "europe-west3"
  zone = "europe-west3-a"
  credentials = "../key.json"
}

resource google_storage_bucket "create_bucket"{
  name = "patricks-tf-bucket"
  location = "europe-west3"
}