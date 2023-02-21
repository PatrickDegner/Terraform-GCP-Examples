resource "google_compute_instance" "vm-from-tf" {
  name = "vm-from-tf"
  zone = "europe-west3-a"
  machine_type = "n2-standard-4"

  # allow_stopping_for_update = true

  network_interface {
    network = "custom-vpc-tf"
    subnetwork = "sub-sg"
  }

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20230206"
      size = 35      
    }
    auto_delete = false
  }

  labels = {
    "env" = "dev"
  }

  # scheduling {
  #   preemptible = true
  #   automatic_restart = false
  # }
  
  service_account {
    email = "terraform-gcp@terraform-project-378317.iam.gserviceaccount.com"
    scopes = [ "cloud-platform" ]
  }

  lifecycle {
    ignore_changes = [
      attached_disk
    ]
  }

}

resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 10
  zone = "europe-west3-a"
  type = "pd-ssd"
}

resource "google_compute_attached_disk" "adisk" {
  disk = google_compute_disk.disk-1.id
  instance = google_compute_instance.vm-from-tf.id
}

