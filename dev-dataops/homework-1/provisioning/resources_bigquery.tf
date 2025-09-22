resource "google_bigquery_dataset" "bq_dataset" {
  project  = var.project_id
  location = var.bq_location

  dataset_id    = local.bq_dataset_id
  friendly_name = local.bq_dataset_friendly_name
  description   = local.bq_dataset_description

  default_table_expiration_ms = var.default_table_expiration_days > 0 ? var.default_table_expiration_days * 24 * 60 * 60 * 1000 : 0

  delete_contents_on_destroy = false
}