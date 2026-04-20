# ============================================================
# modules/cloudfront/main.tf - CloudFront-Modul
# Erstellt: CloudFront Distribution mit HTTPS-Zwang
# ============================================================

resource "aws_cloudfront_distribution" "website" {
  enabled             = true
  default_root_object = "index.html"

  # Origin: S3-Bucket als Ursprungsquelle der Inhalte
  # Bei Cache-Miss holt CloudFront die Datei von hier
  origin {
    domain_name = var.bucket_domain_name
    origin_id   = "s3-origin"

    s3_origin_config {
      origin_access_identity = ""
    }
  }

  # Cache-Verhalten: nur lesende Methoden erlaubt
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "s3-origin"

    # HTTP wird automatisch auf HTTPS umgeleitet (Port 80 → Port 443)
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  # Keine geografischen Einschränkungen — weltweit erreichbar
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # CloudFront verwaltet TLS-Zertifikat und Domain selbstständig
  # Keine eigene Domain oder separater Certificate Manager nötig
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
