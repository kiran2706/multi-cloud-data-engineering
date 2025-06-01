# AWS region where resources will be created
variable "region" {
  description = "AWS region where resources will be created"
  type        = string
}

# Name of the Lambda function
variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

# Runtime environment for the Lambda function (e.g., python3.9)
variable "runtime" {
  description = "Runtime for the Lambda function (e.g., python3.9)"
  type        = string
}

# Handler entry point for the Lambda function (e.g., main.trigger_ingestion)
variable "handler" {
  description = "Handler entry point for the Lambda function"
  type        = string
}

# Path to the deployment ZIP file for the Lambda function
variable "source_zip_file" {
  description = "Path to the deployment ZIP file"
  type        = string
}

# IAM Role ARN to be assumed by the Lambda function
variable "lambda_role_arn" {
  description = "IAM Role ARN to be assumed by the Lambda function"
  type        = string
}

# Amount of memory allocated to the Lambda function (MB)
variable "memory_size" {
  description = "Amount of memory allocated to the Lambda function"
  type        = number
  default     = 128
}

# Maximum execution time for the Lambda function (seconds)
variable "timeout" {
  description = "Maximum execution time for the Lambda function"
  type        = number
  default     = 30
}

# Name of the Kinesis stream (for reference or tagging)
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
