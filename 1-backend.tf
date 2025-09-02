# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket      = "andregclass65bucket"
    prefix      = "terraform/state"
    credentials = "andregclass65-5c81bb6dd1a8.json"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}
##############################