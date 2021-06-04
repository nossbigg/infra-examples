resource "aws_wafv2_web_acl" "cf_wafv2_web_acl" {
  name        = "cf_wafv2_web_acl"
  description = "Example of a rate based statement."
  scope       = "CLOUDFRONT"

  default_action {
    allow {}
  }

  rule {
    name     = "rule_country_non_targets"
    priority = 1

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = 1000
        aggregate_key_type = "IP"

        scope_down_statement {
          not_statement {
            statement {
              geo_match_statement {
                country_codes = ["SG", "MY"]
              }
            }
          }
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "cf_wafv2_web_acl_metric_rule_country_non_targets"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "rule_country_targets"
    priority = 2

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = 2000000
        aggregate_key_type = "IP"

        scope_down_statement {
          geo_match_statement {
            country_codes = ["SG", "MY"]
          }
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "cf_wafv2_web_acl_metric_rule_country_targets"
      sampled_requests_enabled   = true
    }
  }

  tags = {
    Tag1 = "Value1"
    Tag2 = "Value2"
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "cf_wafv2_web_acl_metric"
    sampled_requests_enabled   = true
  }
}