# Output API ID
output "api_id" {
  description = "ID of the API Gateway"
  value       = aws_apigatewayv2_api.this.id
}

# Output execution ARN (used in Lambda permission)
output "execution_arn" {
  description = "Execution ARN of the API Gateway"
  value       = aws_apigatewayv2_api.this.execution_arn
}

# Output base invoke URL
output "invoke_url" {
  description = "Base invoke URL for the API Gateway stage"
  value       = "${aws_apigatewayv2_api.this.api_endpoint}/${aws_apigatewayv2_stage.this.name}"
}
