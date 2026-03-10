variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "region" {
  description = "The region to provision resources in."
  type        = string
  default     = "us-central1"
}

variable "function_name" {
  description = "The name of the Cloud Function."
  type        = string
}

variable "allow_unauthenticated" {
  description = "Whether to allow unauthenticated invocations of the Cloud Function."
  type        = bool
  default     = false
}

variable "source_bucket_name" {
  description = "The name of the GCS bucket where the function source code is located. The source is managed externally."
  type        = string
  default     = null
}

variable "source_archive_object" {
  description = "The name of the GCS object (zip file) containing the function source code. The source is managed externally."
  type        = string
  default     = null
}

variable "entry_point" {
  description = "The execution point of the function."
  type        = string
  default     = "helloHttp"
}

variable "runtime" {
  description = "The runtime in which to run the function."
  type        = string
  default     = "nodejs20"
}
