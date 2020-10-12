# wildcard-cloudfront

This project is a minimal setup required to host a CloudFront distribution associated with a wildcard domain using Route 53 + CloudFront + ACM.

## Prerequisites

- Must already own a domain (eg. `myowndomain.com`)
- Must have created Route 53 zone that is associated with the aforementioned domain.

## Usage

- Define the following variables to customize project to own specifications (in `main.tf`)
  - `base_r53_zone`: For Terraform to know which hosted zone to create requisite Route 53 records in
  - `base_domain_name`: Base domain name (eg. `examplewc.nossbigg.com`) to associate with CloudFront distribution
  - `wildcard_subdomain_name` Wildcard subdomain name (eg. `*.examplewc.nossbigg.com`) to associate with CloudFront distribution

## Gotchas

- ACM certificate **must** be in `us-east-1` region, in order for CloudFront to successfully associate with the certificate (see more: [docs](https://docs.aws.amazon.com/acm/latest/userguide/acm-regions.html))
- Aliases that are associated to the CloudFront distribution **must** be covered by its associated ACM certificate
- Aliases must be an **exact match** to domains specified in associated ACM certificate
  - eg. This will fail: Aliases `subdomain.domain.com`, ACM certificate `subdomain.domain.com.`
- `terraform apply` may fail occasionally
  - eg. Failure when AWS tries to associate the CloudFront distribution with the ACM certificate, even though Terraform correctly provisions the ACM certificate first

## References

- [Requirements for Using SSL/TLS Certificates with CloudFront - Amazon CloudFront](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cnames-and-https-requirements.html)
- [Using Custom URLs for Files by Adding Alternate Domain Names (CNAMEs) - Amazon CloudFront](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/CNAMEs.html#alternate-domain-names-requirements)
- [cloudfront_distribution | Resources | hashicorp/aws | Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/)
- [aws_acm_certificate | Resources | hashicorp/aws | Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate)
- [aws_route53_record | Resources | hashicorp/aws | Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record)
- [aws_route53_zone | Data Sources | hashicorp/aws | Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone)
