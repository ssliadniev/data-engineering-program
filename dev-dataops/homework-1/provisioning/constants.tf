locals {
  project_name = "hometask-1"

  bucket_name = "${local.project_name}-gcs-bucket"

  bq_dataset_id            = "gsp_bq_dataset"
  bq_dataset_friendly_name = "[${local.project_name}] BigQuery Dataset"
  bq_dataset_description   = "GCP BigQuery dataset"

  vm_name = "${local.project_name}-vm"
}
