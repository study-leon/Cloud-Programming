# ============================================================
# modules/s3/outputs.tf - Ausgaben des S3-Moduls
# Werden vom CloudFront-Modul als Eingabe verwendet
# ============================================================

output "bucket_id" {
  description = "ID (Name) des erstellten S3-Buckets"
  value       = aws_s3_bucket.website.id
}

output "bucket_regional_domain_name" {
  description = "Regionaler Domain-Name des Buckets (wird als CloudFront Origin verwendet)"
  value       = aws_s3_bucket.website.bucket_regional_domain_name
}

output "bucket_arn" {
  description = "ARN des S3-Buckets"
  value       = aws_s3_bucket.website.arn
}
