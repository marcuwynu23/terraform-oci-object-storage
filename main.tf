# Buckets are addressed by the tenancy's Object Storage namespace, which is a
# system-generated string rather than something you choose. Look it up instead
# of asking for it as a variable. No argument is needed: the namespace belongs
# to the tenancy the provider authenticated as.
data "oci_objectstorage_namespace" "this" {}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "oci_objectstorage_bucket" "bucket" {
  compartment_id = var.compartment_id
  namespace      = data.oci_objectstorage_namespace.this.namespace
  name           = "${var.bucket_name}-${random_id.bucket_suffix.hex}"

  # Private bucket. ObjectRead / ObjectReadWithoutList would expose every object
  # to the internet and require an explicit bucket policy, so stay at the
  # default.
  access_type = "NoPublicAccess"

  # Standard tier is what the Always Free 20 GB allowance covers. Note this
  # property is immutable after creation.
  storage_tier = "Standard"
}
