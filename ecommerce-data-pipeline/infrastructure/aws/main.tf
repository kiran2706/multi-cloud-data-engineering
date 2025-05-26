module "kinesis_stream" {
  source       = "./modules/kinesis"
  stream_name  = "product-ingestion-stream"
  shard_count  = 1
}

module "lambda_trigger" {
  source               = "./modules/lambda_trigger"
  region               = "us-east-1"
  kinesis_stream_name  = module.kinesis_stream.stream_name
}