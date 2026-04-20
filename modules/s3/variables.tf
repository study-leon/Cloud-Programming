# ============================================================
# modules/s3/variables.tf - Eingabevariablen des S3-Moduls
# ============================================================

variable "bucket_name" {
  description = "Name des S3-Buckets (muss global eindeutig sein)"
  type        = string
}
