include {
  path = find_in_parent_folders()
}

dependency "a" {
  config_path = "../a"

  mock_outputs = {
    folder_id = "mock_folder_id"
  }
}

inputs = {
  parent_folder_id = dependency.a.outputs.folder_id
}