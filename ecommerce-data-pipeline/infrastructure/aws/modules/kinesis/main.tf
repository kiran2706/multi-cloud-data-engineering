# Kinesis stream resource for ingesting product data
resource "aws_kinesis_stream" "stream" {
  name        = var.stream_name   # Name of the Kinesis stream
  shard_count = var.shard_count   # Number of shards for the stream
}
