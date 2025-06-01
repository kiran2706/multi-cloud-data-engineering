# Name of the Kinesis stream to create
variable "stream_name" {
  description = "Name of the Kinesis stream"
  type        = string
}

# Number of shards for the Kinesis stream
variable "shard_count" {
  description = "Number of shards in the stream"
  type        = number
}
