resource "google_storage_bucket" "benhriz-terraform" {
  name          = var.bucket_name
  location      = var.project_region
  storage_class = "STANDARD"
  # add force destroy for full bucket to destroy
  force_destroy = true
  # Prevents public access to a bucket
  #public_access_prevention = "inherited"
  
  versioning {
    enabled = true
  }
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 5
      age = "1"
    }
    }
}

#resource "google_storage_bucket_object" "terraform_statefiles" {
#  name          = "terraform_statefiles/"
#  content       = "folder to store our terraform statefiles to keep on touch about any changes of our infra."
#  bucket        = var.bucket_name
#  depends_on = [google_storage_bucket.benhriz-terraform]
#}

#resource "google_storage_bucket_object" "terraform_outputs" {
#  name          = "terraform_outputs/"
#  content       = "folder to store our terraform outputs to keep on touch about any changes of our infra."
#  bucket        = var.bucket_name
#  depends_on = [google_storage_bucket.benhriz-terraform]
#}

