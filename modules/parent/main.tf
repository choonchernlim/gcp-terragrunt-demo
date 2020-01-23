// terragrunt will fill this block
terraform {
  backend "gcs" {}
}

resource "google_folder" "folder" {
  display_name = "terragrunt_demo_parent"
  parent       = "organizations/${var.org_id}"
}