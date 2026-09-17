terraform {
  # skip_s3_checksum (used by the backend below) requires Terraform >= 1.6.4.
  required_version = ">= 1.6.4"

  # OCI Object Storage has no native Terraform backend, so remote state is kept
  # in an Object Storage bucket through its S3-compatible API. That is why this
  # uses the `s3` backend with the skip_* / path-style flags below and a custom
  # endpoint. The flags are structural to the S3 compatibility layer, so they
  # live here; the environment-specific values (bucket, key, region, endpoints)
  # come from backend.tfvars. See "Remote State (Object Storage)" in the README.
  # backend "s3" {
  #   skip_region_validation      = true
  #   skip_credentials_validation = true
  #   skip_requesting_account_id  = true
  #   skip_metadata_api_check     = true
  #   use_path_style              = true
  #   skip_s3_checksum            = true
  # }

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 9.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.9"
    }
  }
}

provider "oci" {
  auth                = var.oci_auth
  config_file_profile = var.oci_config_profile
  region              = var.oci_region
}
