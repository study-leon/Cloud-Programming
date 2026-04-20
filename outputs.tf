# ============================================================
# outputs.tf - Ausgaben nach terraform apply
# Zeigt die wichtigsten Informationen nach dem Deployment
# ============================================================

output "cloudfront_domain" {
  description = "Öffentliche URL der Website über CloudFront"
  value       = module.cloudfront.cloudfront_domain_name
}

output "s3_bucket_name" {
  description = "Name des erstellten S3-Buckets"
  value       = module.s3.bucket_id
}

output "website_url" {
  description = "Vollständige HTTPS-URL der Website"
  value       = "https://${module.cloudfront.cloudfront_domain_name}"
}
