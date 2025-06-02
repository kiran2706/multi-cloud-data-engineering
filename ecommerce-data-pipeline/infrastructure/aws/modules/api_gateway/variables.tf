variable "api_name" {
  description = "Name of the API Gateway HTTP API"
  type        = string
}

variable "lambda_arn" {
  description = "ARN of the Lambda function integrated with API Gateway"
  type        = string
}

variable "stage_name" {
  description = "Deployment stage name (e.g., prod)"
  type        = string
  default     = "prod"
}
