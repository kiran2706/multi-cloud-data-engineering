# Output the name of the created Lambda function
output "lambda_function_name" {
  description = "Name of the created Lambda function"
  value       = aws_lambda_function.this.function_name
}

# Output the public URL of the Lambda function
output "function_url" {
  description = "The URL of the Lambda function"
  value       = aws_lambda_function_url.this.url_id
}

# Output the ARN of the created Lambda function
output "lambda_function_arn" {
  description = "ARN of the created Lambda function"
  value       = aws_lambda_function.this.arn
}