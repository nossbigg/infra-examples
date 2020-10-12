locals {
  base_r53_zone           = "nossbigg.com"
  base_domain_name        = "examplewc.nossbigg.com"
  wildcard_subdomain_name = "*.examplewc.nossbigg.com"
  r53_aliases             = [local.base_domain_name, local.wildcard_subdomain_name]
}

