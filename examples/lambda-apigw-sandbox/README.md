# lambda-apigw-sandbox

This project is a minimal setup required to use a Lambda function attached to an API Gateway.

## Usage

- Modify `lambda_logic/lambda_apigw.js` to experiment with Lambda function logic
  - Default logic contains a JSON response returning the `context` and `event` information received by the Lambda, for ease of experimentation.
  - Default logic also logs `context` and `event` information to console (see logs in CloudWatch)
- Use `terraform output` to retrieve URL of API Gateway (`apigw_url`)
- View Lambda Function logs via CloudWatch log groups (default is `/aws/lambda/lambda_apigw_sandbox_fn`)

## References

- [Tutorial: Build a Hello World REST API with Lambda proxy integration - Amazon API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-create-api-as-simple-proxy-for-lambda.html)
- [AWS Lambda function logging in Node.js - AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/nodejs-logging.html)
- [aws_apigatewayv2_api | Resources | hashicorp/aws | Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api)
- [aws_lambda_function | Resources | hashicorp/aws | Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function)
