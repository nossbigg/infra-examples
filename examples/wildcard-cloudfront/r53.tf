// existing route 53 zone
data "aws_route53_zone" "r53_zone" {
  name         = local.base_r53_zone
  private_zone = false
}

resource "aws_route53_record" "r53_alias_records" {
  for_each = toset(local.r53_aliases)

  zone_id = data.aws_route53_zone.r53_zone.zone_id
  name    = each.key
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.wildcard_cloudfront_example.domain_name
    zone_id                = aws_cloudfront_distribution.wildcard_cloudfront_example.hosted_zone_id
    evaluate_target_health = true
  }
}

// note: since hosted zone for 'nossbigg.com' and '*.nossbigg.com' is the same, only need to create single CNAME record in the zone
resource "aws_route53_record" "cf_cert_r53_validation_record" {
  name    = local.cf_cert_dvo_first.resource_record_name
  records = [local.cf_cert_dvo_first.resource_record_value]
  ttl     = 60
  type    = local.cf_cert_dvo_first.resource_record_type
  zone_id = data.aws_route53_zone.r53_zone.zone_id
}
