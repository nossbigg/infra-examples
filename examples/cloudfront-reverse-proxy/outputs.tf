output "cf_url" {
  value = aws_cloudfront_distribution.cf_reverse_proxy.domain_name
}
