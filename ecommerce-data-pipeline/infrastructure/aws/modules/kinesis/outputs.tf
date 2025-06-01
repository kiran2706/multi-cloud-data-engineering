# Output the name of the created Kinesis stream
output "stream_name" {
  description = "Name of the created Kinesis stream"
  value       = aws_kinesis_stream.stream.name
}

# Output the ARN of the created Kinesis stream
output "stream_arn" {
  description = "ARN of the created Kinesis stream"
  value       = aws_kinesis_stream.stream.arn
}
