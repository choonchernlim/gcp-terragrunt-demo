# Terragrunt Demo

This demo illustrates the following:
* Performs `plan-all`, `apply-all` and `destroy-all` at root directory.
* Creates a dependency by passing an output value from `modules/a` to `modules/b`.
* Creates GCS buckets to store each module's state file.


## Terragrunt Installation

    # Get into ~/bin. If this dir doesn't exist, create one.
    cd ~/bin/

    # Download binary
    wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.21.11/terragrunt_linux_amd64

    # Give execute permission
    chmod +x terragrunt_linux_amd64

    # Rename file
    mv terragrunt_linux_amd64 terragrunt

    # Test to see if command works
    terragrunt --version

* Create a GCS bucket directly in GCP called `terragrunt-demo`. The reason for this is it simplifies the Terragrunt setup a little bit.


## Running the Code

    # Go to root dir
    cd ~/terragrunt-demo

    # From root dir, recursively plan all modules
    terragrunt plan-all

    # From root dir, recursively apply all modules
    echo "Y" | terragrunt apply-all

    # From root dir, recursively destroy all modules
    echo "Y" | terragrunt destroy-all