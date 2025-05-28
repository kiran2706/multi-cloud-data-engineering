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
}
