output "bucket" {
  description = "The created storage bucket"
  value       = google_storage_bucket.bucket
}

output "bucket_name" {
  description = "The name of the bucket."
  value       = google_storage_bucket.bucket.name
}

output "bucket_url" {
  description = "The self_link of the created bucket."
  value       = google_storage_bucket.bucket.self_link
}
