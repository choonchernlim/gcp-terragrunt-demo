include {
  path = find_in_parent_folders()
}

dependency "parent" {
  config_path = "../parent"

  // this is needed to satisfy the dependency if `parent` module is not provisioned yet
  // when running `terragrunt plan-all` from root level
  mock_outputs = {
    folder_id = "mock_folder_id"
  }
}

inputs = {
  parent_folder_id = dependency.parent.outputs.folder_id
}