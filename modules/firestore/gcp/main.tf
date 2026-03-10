resource "google_firestore_database" "database" {
  project     = var.project_id
  name        = "(default)"
  location_id = var.database_location
  type        = "FIRESTORE_NATIVE"
}
