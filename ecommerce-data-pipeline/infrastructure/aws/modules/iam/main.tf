# Get AWS account ID dynamically
data "aws_caller_identity" "current" {}

# IAM Role for Lambda execution
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda-trigger-kinesis-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# IAM Policy allowing Lambda to put records into Kinesis stream
resource "aws_iam_policy" "put_to_kinesis" {
  name        = "LambdaPutToKinesisPolicy"
  description = "Allows Lambda to put records into the Kinesis stream"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "kinesis:PutRecord",
          "kinesis:PutRecords"
        ],
        Resource = "arn:aws:kinesis:${var.region}:${data.aws_caller_identity.current.account_id}:stream/${var.kinesis_stream_name}"
      }
    ]
  })
}

# IAM Policy allowing Lambda to write logs to CloudWatch Logs
resource "aws_iam_policy" "lambda_cloudwatch_logs" {
  name        = "LambdaCloudWatchLogsPolicy"
  description = "Allows Lambda functions to write logs to CloudWatch Logs"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",  # This is an allow policy
        Action = [         # List of allowed CloudWatch Logs actions
          "logs:CreateLogGroup",    # Allows creation of a log group
          "logs:CreateLogStream",   # Allows creation of a log stream in the group
          "logs:PutLogEvents"       # Allows pushing actual logs to the log stream
        ],
        Resource = "arn:aws:logs:*:*:*"  # Wildcard to allow writing logs in any region and account
      }
    ]
  })
}

# Attach Kinesis put policy to the Lambda execution role
resource "aws_iam_role_policy_attachment" "attach_kinesis_policy" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.put_to_kinesis.arn
}

# Attach CloudWatch Logs policy to the Lambda execution role
resource "aws_iam_role_policy_attachment" "attach_lambda_cloudwatch_logs" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_cloudwatch_logs.arn
}
