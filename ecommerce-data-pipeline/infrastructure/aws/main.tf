module "kinesis_stream" {
  source       = "./modules/kinesis"
  stream_name  = "product-ingestion-stream"
  shard_count  = 1
}
