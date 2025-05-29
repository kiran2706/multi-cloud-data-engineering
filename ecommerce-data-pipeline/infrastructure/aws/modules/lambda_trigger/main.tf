# Create the Lambda function
resource "aws_lambda_function" "this" {
  # Name of the function
  function_name = var.function_name

  # Runtime environment, e.g., python3.9
  runtime = var.runtime

  # The handler is the entry point (e.g., main.trigger_ingestion)
  handler = var.handler

  # Path to the ZIP deployment package
  filename = var.source_zip_file

  # Memory allocated to the function
  memory_size = var.memory_size

  # Maximum execution time in seconds
  timeout = var.timeout

  # IAM Role ARN for execution — passed from iam module
  role = var.lambda_role_arn

  # Track changes to ZIP file contents
  source_code_hash = filebase64sha256(var.source_zip_file)

  # Environment variables for the Lambda function
  environment {
    variables = var.environment_variables
  }
}

# Create a function URL to make the Lambda publicly accessible
resource "aws_lambda_function_url" "this" {
  function_name      = aws_lambda_function.this.function_name
  authorization_type = "NONE"  # Makes the function publicly accessible

  cors {
    allow_origins     = ["*"]  # Allows requests from any origin
    allow_methods     = ["*"]  # Allows all HTTP methods
    allow_headers     = ["*"]  # Allows all headers
    expose_headers    = ["*"]  # Exposes all headers
    max_age          = 86400  # Cache preflight requests for 24 hours
  }
}
