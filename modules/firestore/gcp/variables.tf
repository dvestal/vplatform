variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "database_location" {
  description = "The location for the Firestore Database."
  type        = string
  default     = "nam5" # US multi-region
}
