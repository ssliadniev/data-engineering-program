terraform {
  backend "gcs" {
    bucket  = "4eaabf64-tfstate-bucket"
    prefix  = "hometask-1"
  }
}
