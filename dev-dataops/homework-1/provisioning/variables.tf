variable "project_id" {
  description = "The GCP project ID where resources will be deployed."
  type        = string
  nullable    = false
}

variable "gcp_region" {
  description = "The primary GCP region for provider-level resources."
  type        = string
  default     = "US-CENTRAL1"
}

variable "gcs_location" {
  description = "The location for the GCS bucket."
  type        = string
  default     = "US-CENTRAL1"
}

variable "bq_location" {
  description = "The geographic location of the dataset."
  type        = string
  default     = "US-CENTRAL1"
}

variable "default_table_expiration_days" {
  description = "The default number of days after which tables in this dataset expire. Set to 0 to disable."
  type        = number
  default     = 90
}

variable "machine_type" {
  description = "The machine type for the VM."
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "The GCP zone to deploy the VM in."
  type        = string
  default     = "us-central1-a"
}

variable "boot_disk_image" {
  description = "The boot disk image for the VM."
  type        = string
  default     = "debian-cloud/debian-11"
}
