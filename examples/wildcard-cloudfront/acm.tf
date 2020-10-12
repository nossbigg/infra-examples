resource "aws_acm_certificate" "cf_cert" {
  domain_name               = local.base_domain_name
  subject_alternative_names = [local.wildcard_subdomain_name]

  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cf_cert_validation" {
  certificate_arn         = aws_acm_certificate.cf_cert.arn
  validation_record_fqdns = [aws_route53_record.cf_cert_r53_validation_record.fqdn]
}

locals {
  cf_cert_dvo_first = tolist(aws_acm_certificate.cf_cert.domain_validation_options)[0]
}