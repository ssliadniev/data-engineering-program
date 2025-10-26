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
  description = "The location for the GCS state bucket."
  type        = string
  default     = "US-CENTRAL1"
}
