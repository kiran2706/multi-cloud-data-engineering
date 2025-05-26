variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "kinesis_stream_name" {
  description = "Name of the Kinesis stream the Lambda will write to"
  type        = string
}
