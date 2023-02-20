resource "google_compute_network" "custom-vpc-tf" {
  name = "custom-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name = "sub-sg"
  network = google_compute_network.custom-vpc-tf.id
  ip_cidr_range = "10.1.0.0/24"
  region = "europe-west3"
  private_ip_google_access = true
}

resource "google_compute_firewall" "allow-icmp" {
  name = "allow-icmp"
  network = google_compute_network.custom-vpc-tf.id
  allow {
    protocol = "icmp"
  }
  source_ranges = ["5.146.39.118/32"]
  priority = 500
}

resource "google_compute_firewall" "allow-tcp" {
  name = "allow-tcp"
  network = google_compute_network.custom-vpc-tf.id
  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }
  source_ranges = ["5.146.39.118/32"]
  priority = 500
}

output "custom" {
  value = google_compute_network.custom-vpc-tf.id
}