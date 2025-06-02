# Create the API Gateway HTTP API
resource "aws_apigatewayv2_api" "this" {
  name          = var.api_name                # Name of the API Gateway
  protocol_type = "HTTP"                      # HTTP APIs support Lambda proxy integration and more
}

# Create the Lambda integration for the API Gateway
resource "aws_apigatewayv2_integration" "lambda" {
  api_id                 = aws_apigatewayv2_api.this.id
  integration_type       = "AWS_PROXY"                         # Using Lambda proxy integration
  integration_uri        = var.lambda_arn                      # Lambda function ARN
  integration_method     = "POST"                              # Integration method (must match the route method)
  payload_format_version = "2.0"                               # Required for HTTP APIs
}

# Define a POST route for /ingest
resource "aws_apigatewayv2_route" "post_ingest" {
  api_id    = aws_apigatewayv2_api.this.id
  route_key = "POST /ingest"                                   # Route definition
  target    = "integrations/${aws_apigatewayv2_integration.lambda.id}"  # Binds route to Lambda integration
}

# Create the API deployment
resource "aws_apigatewayv2_deployment" "this" {
  api_id = aws_apigatewayv2_api.this.id

  # Force new deployment if route or integration changes
  depends_on = [
    aws_apigatewayv2_route.post_ingest
  ]
}

# Create the stage (e.g., prod)
resource "aws_apigatewayv2_stage" "this" {
  api_id        = aws_apigatewayv2_api.this.id
  name          = var.stage_name                               # Stage name (e.g., prod)
  deployment_id = aws_apigatewayv2_deployment.this.id
  auto_deploy   = false                                         # Manual deployment control
}

# Lambda permission to allow API Gateway to invoke the Lambda function
resource "aws_lambda_permission" "allow_apigateway_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.this.execution_arn}/*/POST/ingest"
}
