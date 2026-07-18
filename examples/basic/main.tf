terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "iam" {
  source = "../.."

  project_id = var.project_id

  bindings = {
    "roles/viewer" = [
      "group:developers@example.com",
    ]
    "roles/storage.admin" = [
      "serviceAccount:app@${var.project_id}.iam.gserviceaccount.com",
    ]
  }
}

variable "project_id" {
  description = "Project ID to apply the example IAM bindings to."
  type        = string
}

variable "region" {
  description = "Region for the google provider."
  type        = string
  default     = "us-central1"
}

output "member_ids" {
  value = module.iam.member_ids
}
