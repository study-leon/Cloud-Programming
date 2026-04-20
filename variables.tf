# ============================================================
# variables.tf - Zentrale Variablendefinitionen
# Werte können über terraform.tfvars oder CLI überschrieben werden
# ============================================================

variable "aws_region" {
  description = "AWS-Region in der die Infrastruktur erstellt wird"
  type        = string
  default     = "eu-central-1" # Frankfurt
}

variable "bucket_name" {
  description = "Name des S3-Buckets (muss global eindeutig sein)"
  type        = string
  default     = "study-leon-terraform-demo"
}
