output "lambda_function_name" {
  description = "Name of the created Lambda function"
  value       = aws_lambda_function.this.function_name
}

output "function_url" {
  description = "The URL of the Lambda function"
  value       = aws_lambda_function_url.this.url_id
}