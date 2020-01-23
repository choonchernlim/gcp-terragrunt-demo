terraform {
  backend "gcs" {}
}

resource "google_folder" "folder" {
  display_name = "terragrunt_demo_folder_b"
  parent       = var.parent_folder_id
}