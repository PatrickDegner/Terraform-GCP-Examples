resource "google_cloud_run_service" "run-app-from-tf" {
  name = "run-app-from-tf"
  location = "europe-west3"
  
  template {
    spec {
      containers {
        image = "gcr.io/google-samples/hello-app:1.0"
        # image = "gcr.io/google-samples/hello-app:2.0"
      }
    }
  }
}

resource "google_cloud_run_service_iam_policy" "pub_access" {
  service = google_cloud_run_service.run-app-from-tf.name
  location = google_cloud_run_service.run-app-from-tf.location
  policy_data = data.google_iam_policy.pub-1.policy_data
}

data "google_iam_policy" "pub-1" {
  binding {
    role = "roles/run.invoker"
    members = [ "allUsers", ]
  }
}