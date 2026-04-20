# ============================================================
# modules/s3/main.tf - S3-Modul
# Erstellt: S3-Bucket, Website-Hosting-Konfiguration, Bucket-Policy
# ============================================================

# S3-Bucket für statisches Website-Hosting
resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
}

# Statisches Website-Hosting aktivieren
# index.html wird als Startseite definiert
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }
}

# Öffentlichen Zugriff auf den Bucket erlauben
# Notwendig damit CloudFront die Dateien lesen kann
resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Bucket-Policy: erlaubt öffentlichen Lesezugriff (s3:GetObject)
# Hinweis: Für Produktion empfiehlt sich OAC statt öffentlicher Policy
resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id

  # Abhängigkeit: Public Access Block muss zuerst konfiguriert sein
  depends_on = [aws_s3_bucket_public_access_block.website]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website.arn}/*"
      }
    ]
  })
}
