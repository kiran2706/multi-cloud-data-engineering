output "lambda_exec_role_arn" {
  description = "The ARN of the IAM Role used by the Lambda function"
  value       = aws_iam_role.lambda_exec_role.arn
}
