provider "google" {
  project = var.project
}

resource "google_storage_bucket" "object" {
  name          = var.bucket_name
  location      = var.location
  storage_class = var.storage_class

  versioning {
    enabled = true
  }

  # iam_configuration {
  # 	uniform_bucket_level_access {
  # 		enabled = true
  # 	}
  # 	public_access_prevention = "enforced"
  # }

  labels = {
    managed_by = "terraform"
  }
}
