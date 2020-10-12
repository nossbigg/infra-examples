output "apigw_url" {
  description = "URL endpoint of API Gateway"
  value = aws_apigatewayv2_api.apigw.api_endpoint
}
