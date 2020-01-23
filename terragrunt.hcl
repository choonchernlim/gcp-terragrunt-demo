remote_state {
  backend = "gcs"
  config = {
    bucket = "terragrunt-demo"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
  }
}
