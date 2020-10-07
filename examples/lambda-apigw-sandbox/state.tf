terraform {
  backend "remote" {
    # CHANGEME to own organization
    organization = "nossbigg"

    workspaces {
      name = "lambda-apigw-sandbox"
    }
  }
}
