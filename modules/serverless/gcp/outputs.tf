output "function_name" {
  description = "The name of the Cloud Function."
  value       = google_cloudfunctions2_function.function.name
}

output "function_url" {
  description = "The URL of the Cloud Function."
  value       = google_cloudfunctions2_function.function.url
}

