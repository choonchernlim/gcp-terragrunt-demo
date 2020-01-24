# GCP Terragrunt Demo

This simple demo illustrates the following use cases:-

* Provisions all modules recursively.
* Passes common variables to all modules.
* Creates a module dependency by passing an output value from `parent` module to `child` module.
* Stores all module state files in a GCS bucket called `gcp-terragrunt-demo`. This GCS bucket has the following directory structure:- 

```
gcp-terragrunt-demo                      
└── modules                         
    ├── child                       
    │   └── terraform.tfstate       
    └── parent                      
        └── terraform.tfstate       
```

## Getting Started

* [Install Terraform](https://learn.hashicorp.com/terraform/getting-started/install).
    * After installation, run `terraform --version` to ensure it works.

* [Install Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/).
    * After installation, run `terragrunt --version` to ensure it works.

* Go to [\[ROOT_DIR\]/terragrunt.hcl](terragrunt.hcl) and update the parameters in `locals { ... }` block.

* If you are running the code outside of GCP environment (ie: not in Cloud Shell, but from your IDE), run the `gloud` commands below to get authenticated first:- 
    * `gcloud auth login` 
    * `gcloud auth application-default login` 
    * Note: Failure to do so causes Terragrunt to throw "Missing required GCS remote state configuration project" error.

* If the GCS bucket does not exist yet, run this once:-
    * `terragrunt init`
    * Note: Once the GCS bucket is created, there is no need to run this command again.

* To determine changes needed to be applied to the infrastructure:- 
    * `terragrunt plan-all`

* To provision the entire infrastructure by running each module and resolving any module dependencies:-
    * `terragrunt apply-all`

* To deprovision the entire infrastructure:-
    * `terragrunt destroy-all`
