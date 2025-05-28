output "lambda_function_name" {
  description = "Name of the created Lambda function"
  value       = aws_lambda_function.this.function_name
}