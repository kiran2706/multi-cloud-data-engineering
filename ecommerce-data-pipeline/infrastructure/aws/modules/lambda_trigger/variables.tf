# AWS region (useful if referenced inside the module)
variable "region" {
  description = "AWS region where resources will be created"
  type        = string
}

# Function name for Lambda
variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

# Runtime environment for Lambda
variable "runtime" {
  description = "Runtime for the Lambda function (e.g., python3.9)"
  type        = string
}

# Lambda handler (e.g., main.trigger_ingestion)
variable "handler" {
  description = "Handler entry point for the Lambda function"
  type        = string
}

# Path to the deployment ZIP file
variable "source_zip_file" {
  description = "Path to the deployment ZIP file"
  type        = string
}

# IAM Role ARN for Lambda execution
variable "lambda_role_arn" {
  description = "IAM Role ARN to be assumed by the Lambda function"
  type        = string
}

# Amount of memory in MB allocated to the Lambda function
variable "memory_size" {
  description = "Amount of memory allocated to the Lambda function"
  type        = number
  default     = 128
}

# Timeout in seconds for the Lambda function
variable "timeout" {
  description = "Maximum execution time for the Lambda function"
  type        = number
  default     = 30
}

# Optional: Name of the Kinesis stream (used for tagging or later expansion)
variable "kinesis_stream_name" {
  description = "Name of the Kinesis stream (for reference)"
  type        = string
}

# Environment variables for the Lambda function
variable "environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}
