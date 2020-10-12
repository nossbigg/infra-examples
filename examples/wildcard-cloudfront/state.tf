terraform {
  backend "remote" {
    # CHANGEME to own organization
    organization = "nossbigg"

    workspaces {
      name = "wildcard-cloudfront"
    }
  }
}
