# vPlatform Terraform Modules

This repository contains reusable Terraform modules for provisioning infrastructure for the vPlatform environment. The configuration is architected so that multi-tenant deployments can easily consume these standalone modules to build an entire environment.

## Current Support: Google Cloud Platform (GCP)
The initial phase focuses strictly on **GCP** resources. Future iterations will introduce equivalent modular structures for **AWS** and **Azure**.

## Available Modules

The `modules/` directory is partitioned by service and cloud provider. Currently available modules include:

### 1. Storage (`modules/storage/gcp`)
Provisions a standard Google Cloud Storage Bucket with uniform bucket-level access enabled.
  - Used for file usage and blob management.

### 2. Serverless API (`modules/serverless/gcp`)
Provisions a Cloud Function v2 (powered by Cloud Run).
  - Designed for scalable compute and API endpoints.
  - Supports dynamic definitions of source code repositories and GCS storage blobs.
  - Can be mapped to a public IAM role to allow HTTP execution from unauthenticated clients.

### 3. Firestore (`modules/firestore/gcp`)
Provisions a Firestore native-mode database.
  - Useful for document storage and client-facing web syncs.
  - Completely decoupled from the serverless definition, meaning the function and database can scale, update, and be destroyed with completely individual lifecycles.

## Usage

This project acts as a module registry and does not instantiate any infrastructure on its own. 

To use these modules in a deployment, reference the absolute path or equivalent git-based source argument from your multi-tenant or root environment:

```hcl
module "storage_bucket" {
  source      = "git::https://github.com/your-org/vplatform.git//modules/storage/gcp?ref=main"
  project_id  = var.project_id
  region      = var.region
  bucket_name = "my-unique-bucket-name"
}
```

## Contributing
When adding a new cloud provider (e.g., AWS), please follow the established folder hierarchy (`modules/<service>/<provider>`).
