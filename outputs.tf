output "bucket_name" {
  value       = oci_objectstorage_bucket.bucket.name
  description = "The name of the bucket."
}

output "bucket_namespace" {
  value       = oci_objectstorage_bucket.bucket.namespace
  description = "The Object Storage namespace the bucket lives in."
}

output "bucket_url" {
  value       = "https://objectstorage.${var.oci_region}.oraclecloud.com/n/${oci_objectstorage_bucket.bucket.namespace}/b/${oci_objectstorage_bucket.bucket.name}/o/"
  description = "The base URL of the bucket."
}

output "bucket_id" {
  value       = oci_objectstorage_bucket.bucket.id
  description = "The OCID of the bucket."
}
