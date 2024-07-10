resource "google_compute_global_address" "default" {
  name    = "${var.global_address_name}"
  project = "${var.project_name}"
}