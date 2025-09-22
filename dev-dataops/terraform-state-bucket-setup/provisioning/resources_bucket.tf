resource "random_id" "bucket_prefix" {
  byte_length = 4
}

resource "google_storage_bucket" "gcs_tfstate" {
  name          = "${random_id.bucket_prefix.hex}-tfstate-bucket"
  force_destroy = false
  location      = var.gcs_location
  storage_class = "STANDARD"
  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
