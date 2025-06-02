# AWS region for resource deployment
variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

# Name of the Kinesis stream
variable "kinesis_stream_name" {
  description = "Name of the Kinesis stream"
  type        = string
  default     = "product-ingestion-stream"
}

# Number of shards in the Kinesis stream
variable "kinesis_shard_count" {
  description = "Number of shards in the Kinesis stream"
  type        = number
  default     = 1
}

# Name of the Lambda function
variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "trigger_ingestion"
}

# Runtime for the Lambda function (e.g., python3.9)
variable "lambda_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "python3.9"
}

# Handler for the Lambda function (entry point)
variable "lambda_handler" {
  description = "Handler for the Lambda function"
  type        = string
  default     = "main.trigger_ingestion"
}

# Memory size for the Lambda function in MB
variable "lambda_memory_size" {
  description = "Memory size for the Lambda function in MB"
  type        = number
  default     = 128
}

# Timeout for the Lambda function in seconds
variable "lambda_timeout" {
  description = "Timeout for the Lambda function in seconds"
  type        = number
  default     = 30
}

# Path to the Lambda deployment package (relative to root)
variable "lambda_source_zip_file" {
  description = "Path to the Lambda deployment package"
  type        = string
  default     = "../../lambda_functions/trigger_ingestion/deployment.zip"
}

# Environment variables for the Lambda function
variable "lambda_environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {
    "DATABASE_URL" = "your-database-url"
    "API_KEY"      = "your-api-key"
  }
}

variable "api_gateway_name" {
  description = "Name of the API Gateway"
  type        = string
  default     = "ecommerce-http-api"
}

variable "api_gateway_stage_name" {
  description = "Name of the API Gateway stage"
  type        = string
  default     = "prod"
}

# Tags to apply to all resources
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    Environment = "development"
    Project     = "ecommerce-data-pipeline"
  }
}
