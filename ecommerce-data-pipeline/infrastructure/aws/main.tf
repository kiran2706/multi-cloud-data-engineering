# Creates a Kinesis Data Stream for ingesting product data
# This stream will act as the entry point for real-time product data
module "kinesis_stream" {
  source       = "./modules/kinesis"
  stream_name  = "product-ingestion-stream"  # Name of the Kinesis stream
  shard_count  = 1                          # Number of shards for parallel processing
}

# Sets up IAM roles and permissions for Lambda to access Kinesis
# This module creates the necessary security policies and execution role
module "iam" {
  source               = "./modules/iam"
  region               = "us-east-1"         # AWS region for deployment
  kinesis_stream_name  = module.kinesis_stream.stream_name  # References the Kinesis stream created above
}

# Configures the Lambda function that will add records to the Kinesis stream
# This function is invoked by another trigger (e.g., API Gateway, EventBridge, etc.)
# and writes data into the Kinesis stream for downstream processing
module "lambda_trigger" {
  source               = "./modules/lambda_trigger"
  region               = "us-east-1"         # AWS region for deployment
  kinesis_stream_name  = module.kinesis_stream.stream_name  # Name of the Kinesis stream to write to

  # IAM role configuration for Lambda execution
  lambda_role_arn      = module.iam.lambda_exec_role_arn    # Uses the role created by the IAM module

  # Lambda function configuration
  function_name        = "trigger_ingestion"  # Name of the Lambda function
  runtime              = "python3.9"         # Python runtime version
  handler              = "main.trigger_ingestion"  # Entry point for the Lambda function
  memory_size          = 128                 # Memory allocation in MB
  timeout              = 30                  # Function timeout in seconds
  source_zip_file      = "${path.root}/../../lambda_functions/trigger_ingestion/deployment.zip"  # Path to deployment package
  
  # Environment variables for the Lambda function
  environment_variables = {
    "DATABASE_URL" = "your-database-url"     # Database connection string
    "API_KEY"      = "your-api-key"         # API key for external services
  }
}
