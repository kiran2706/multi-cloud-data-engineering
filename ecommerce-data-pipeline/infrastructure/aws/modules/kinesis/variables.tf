variable "stream_name" {
  type        = string
  description = "Name of the Kinesis stream"
}

variable "shard_count" {
  type        = number
  description = "Number of shards in the stream"
}
