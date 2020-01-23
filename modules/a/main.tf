terraform {
  backend "gcs" {}
}

resource "google_folder" "folder" {
  display_name = "terragrunt_demo_folder_a"
  parent       = "organizations/${var.org_id}"
}