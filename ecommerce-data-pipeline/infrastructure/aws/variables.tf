variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "kinesis_stream_name" {
  description = "Name of the Kinesis stream"
  type        = string
  default     = "product-ingestion-stream"
}

variable "kinesis_shard_count" {
  description = "Number of shards in the Kinesis stream"
  type        = number
  default     = 1
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "trigger_ingestion"
}

variable "lambda_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "python3.9"
}

variable "lambda_handler" {
  description = "Handler for the Lambda function"
  type        = string
  default     = "main.trigger_ingestion"
}

variable "lambda_memory_size" {
  description = "Memory size for the Lambda function in MB"
  type        = number
  default     = 128
}

variable "lambda_timeout" {
  description = "Timeout for the Lambda function in seconds"
  type        = number
  default     = 30
}

variable "lambda_source_zip_file" {
  description = "Path to the Lambda deployment package"
  type        = string
  default     = "../../lambda_functions/trigger_ingestion/deployment.zip"
}

variable "lambda_environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {
    "DATABASE_URL" = "your-database-url"
    "API_KEY"      = "your-api-key"
  }
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    Environment = "development"
    Project     = "ecommerce-data-pipeline"
  }
}
