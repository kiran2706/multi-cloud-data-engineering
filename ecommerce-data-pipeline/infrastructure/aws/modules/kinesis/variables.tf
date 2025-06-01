variable "stream_name" {
  description = "Name of the Kinesis stream"
  type        = string
}

variable "shard_count" {
  description = "Number of shards in the stream"
  type        = number
}
