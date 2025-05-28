variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "kinesis_stream_name" {
  description = "Name of the Kinesis stream that Lambda will write to"
  type        = string
}

variable "role_name" {
  description = "Name of the IAM Role to create"
  type        = string
  default     = "lambda-exec-role"
}
