# ============================================================
# modules/cloudfront/variables.tf - Eingabevariablen des CloudFront-Moduls
# ============================================================

variable "bucket_domain_name" {
  description = "Regionaler Domain-Name des S3-Buckets (als Origin)"
  type        = string
}

variable "bucket_id" {
  description = "ID des S3-Buckets (für Referenzierung)"
  type        = string
}
