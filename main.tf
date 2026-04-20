# ============================================================
# main.tf - Einstiegspunkt der Terraform-Konfiguration
# Ruft die Module s3 und cloudfront auf
# Credentials werden über Umgebungsvariablen übergeben:
#   $env:AWS_ACCESS_KEY_ID
#   $env:AWS_SECRET_ACCESS_KEY
#   $env:AWS_DEFAULT_REGION
# ============================================================

provider "aws" {
  region = var.aws_region
}

# S3-Modul: erstellt Bucket, Hosting-Konfiguration und Bucket-Policy
module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

# CloudFront-Modul: erstellt Distribution mit HTTPS-Zwang
module "cloudfront" {
  source              = "./modules/cloudfront"
  bucket_domain_name  = module.s3.bucket_regional_domain_name
  bucket_id           = module.s3.bucket_id
}
