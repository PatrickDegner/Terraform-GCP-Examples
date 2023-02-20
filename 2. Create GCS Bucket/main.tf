resource google_storage_bucket "GCS_BUCKET1"{
  name = "patricks-tf-bucket"
  location = "europe-west3"
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
  public_access_prevention = "inherited"
  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }
  labels = {
    "env" = "dev"
  }
}