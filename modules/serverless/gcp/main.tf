resource "google_cloudfunctions2_function" "function" {
  name        = var.function_name
  location    = var.region
  project     = var.project_id
  description = "Managed by Terraform"

  build_config {
    runtime     = var.runtime
    entry_point = var.entry_point
    
    dynamic "source" {
      for_each = var.source_bucket_name != null && var.source_archive_object != null ? [1] : []
      content {
        storage_source {
          bucket = var.source_bucket_name
          object = var.source_archive_object
        }
      }
    }
  }

  service_config {
    max_instance_count = 10
    available_memory   = "256M"
    timeout_seconds    = 60
  }
}

resource "google_cloud_run_service_iam_member" "public_access" {
  count    = var.allow_unauthenticated ? 1 : 0
  project  = google_cloudfunctions2_function.function.project
  location = google_cloudfunctions2_function.function.location
  service  = google_cloudfunctions2_function.function.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
