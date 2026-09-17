variable "oci_config_profile" {
  description = "The profile name inside the OCI config file (~/.oci/config) used to authenticate. Set up once with the OCI CLI, the same way gcloud manages application-default credentials for GCP."
  type        = string
  default     = "DEFAULT"
}
variable "oci_auth" {
  description = "The oci auth used."
  type        = string
  default     = "SecurityToken"
}


variable "compartment_id" {
  description = "The OCID of the compartment in which to provision the bucket."
  type        = string
}

variable "oci_region" {
  description = "The OCI region in which to provision the bucket, e.g. us-ashburn-1. Always Free resources should live in your tenancy's home region."
  type        = string
  default     = "us-ashburn-1"
}

variable "bucket_name" {
  description = "The base name of the bucket. A random suffix is appended to ensure the name is unique within the Object Storage namespace."
  type        = string
}
