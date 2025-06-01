# Root main.tf - Orchestrates the entire infrastructure
module "kinesis_stream" {
  source       = "./modules/kinesis"        # Points to the Kinesis module
  stream_name  = var.kinesis_stream_name     # Name of the Kinesis stream
  shard_count  = var.kinesis_shard_count      # Number of shards in the stream
}

# Sets up IAM roles and permissions for Lambda to access Kinesis
# This module creates the necessary security policies and execution role
module "iam" {
  source               = "./modules/iam"
  region               = var.aws_region         # AWS region for deployment
  kinesis_stream_name  = module.kinesis_stream.stream_name  # References the Kinesis stream created above
}

# Configures the Lambda function that will add records to the Kinesis stream
# This function is invoked by another trigger (e.g., API Gateway, EventBridge, etc.)
# and writes data into the Kinesis stream for downstream processing
module "lambda_trigger" {
  source               = "./modules/lambda_trigger"
  region               = var.aws_region         # AWS region for deployment
  kinesis_stream_name  = module.kinesis_stream.stream_name  # Name of the Kinesis stream to write to

  # IAM role configuration for Lambda execution
  lambda_role_arn      = module.iam.lambda_exec_role_arn    # Uses the role created by the IAM module

  # Lambda function configuration
  function_name        = var.lambda_function_name  # Name of the Lambda function
  runtime              = var.lambda_runtime         # Python runtime version
  handler              = var.lambda_handler         # Entry point for the Lambda function
  memory_size          = var.lambda_memory_size       # Memory allocation in MB
  timeout              = var.lambda_timeout          # Function timeout in seconds
  source_zip_file      = var.lambda_source_zip_file      # Path to deployment package
  
  # Environment variables for the Lambda function
  environment_variables = var.lambda_environment_variables
}

# Outputs
output "kinesis_stream_name" {
  description = "Name of the created Kinesis stream"
  value       = module.kinesis_stream.stream_name
}

output "lambda_function_name" {
  description = "Name of the created Lambda function"
  value       = module.lambda_trigger.lambda_function_name
}

output "lambda_function_arn" {
  description = "ARN of the created Lambda function"
  value       = module.lambda_trigger.lambda_function_arn
}
