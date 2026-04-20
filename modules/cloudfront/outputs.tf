# ============================================================
# modules/cloudfront/outputs.tf - Ausgaben des CloudFront-Moduls
# ============================================================

output "cloudfront_domain_name" {
  description = "Automatisch generierte CloudFront-Domain (*.cloudfront.net)"
  value       = aws_cloudfront_distribution.website.domain_name
}

output "cloudfront_distribution_id" {
  description = "ID der CloudFront Distribution (für Cache-Invalidierungen)"
  value       = aws_cloudfront_distribution.website.id
}
