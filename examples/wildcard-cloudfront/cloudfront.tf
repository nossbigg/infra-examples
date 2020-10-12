resource "aws_cloudfront_distribution" "wildcard_cloudfront_example" {
  comment = "wildcard_cloudfront_example"

  enabled = true

  origin {
    domain_name = "nossbigg.github.io"
    origin_id   = "some-origin-id"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods = ["HEAD", "GET"]
    cached_methods  = ["HEAD", "GET"]

    viewer_protocol_policy = "redirect-to-https"
    target_origin_id       = "some-origin-id"

    // disable caching for testing purposes
    min_ttl     = 0
    default_ttl = 0
    max_ttl     = 0

    forwarded_values {
      cookies {
        forward = "all"
      }
      headers      = ["*"]
      query_string = false
    }
  }

  aliases = local.r53_aliases

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.cf_cert.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
