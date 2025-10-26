resource "random_id" "bucket_prefix" {
  byte_length = 4
}

resource "google_storage_bucket" "gcs_bucket" {
  name = "${random_id.bucket_prefix.hex}-${local.bucket_name}"

  project  = var.project_id
  location = var.gcs_location

  storage_class            = "STANDARD"
  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }
}