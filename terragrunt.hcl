#################################################################
# TODO UPDATE THESE PARAMETERS
#################################################################
locals {
  # root bucket for managing module state files
  bucket = "gcp-terragrunt-demo"

  # `project` and `location` are needed to create the bucket if it does not exist
  project = "corebuild-10022019"
  location = "us-central1"

  # this variable will be used by `parent` module
  org_id = "852514890226"
}

# creates GCS bucket for storing states
remote_state {
  backend = "gcs"

  config = {
    bucket = local.bucket
    prefix = "${path_relative_to_include()}/terraform.tfstate"
    project = local.project
    location = local.location
  }
}

# creates environment variables so that modules with matching variable names can automatically read these values
terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    env_vars = {
      TF_VAR_org_id = local.org_id
    }
  }
}