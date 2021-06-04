resource "aws_cloudfront_distribution" "cloudfront_waf_v2_cf" {
  comment = "cloudfront_waf_v2_cf"

  enabled = true

  web_acl_id = aws_wafv2_web_acl.cf_wafv2_web_acl.arn

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
      query_string = true
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
