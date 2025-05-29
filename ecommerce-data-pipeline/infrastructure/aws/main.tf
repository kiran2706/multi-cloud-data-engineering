module "kinesis_stream" {
  source       = "./modules/kinesis"
  stream_name  = "product-ingestion-stream"
  shard_count  = 1
}

module "iam" {
  source               = "./modules/iam"
  region               = "us-east-1"
  kinesis_stream_name  = module.kinesis_stream.stream_name
}

module "lambda_trigger" {
  source               = "./modules/lambda_trigger"
  region               = "us-east-1"
  kinesis_stream_name  = module.kinesis_stream.stream_name

  # Add these lines to connect IAM to Lambda
  lambda_role_arn      = module.iam.lambda_exec_role_arn

  # Required Lambda variables
  function_name        = "trigger_ingestion"
  runtime              = "python3.9"
  handler              = "main.trigger_ingestion"
  memory_size          = 128
  timeout              = 30
  source_zip_file      = "${path.root}/../../lambda_functions/trigger_ingestion/deployment.zip"
  environment_variables = {
                            "DATABASE_URL" = "your-database-url"
                            "API_KEY"      = "your-api-key"
                            }
}
