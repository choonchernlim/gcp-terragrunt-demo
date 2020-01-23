// terragrunt will fill this block
terraform {
  backend "gcs" {}
}

resource "google_folder" "folder" {
  display_name = "terragrunt_demo_child"
  parent       = var.parent_folder_id
}