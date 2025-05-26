"""Handler module to send trigger event to Kinesis."""

# Standard Library
import json
import logging
import os

# Third-party Libraries
import boto3
from botocore.exceptions import ClientError

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)

KINESIS_STREAM_NAME = os.getenv("KINESIS_STREAM_NAME", "your-kinesis-stream-name")

def handle_ingestion_request() -> dict:
    """
    Sends a trigger event message to the configured Kinesis stream
    to start the ingestion pipeline.

    Returns:
        dict: Status of the operation.
    """
    client = boto3.client("kinesis")

    # The message can be simple, e.g. a JSON with a timestamp or a fixed trigger signal
    payload = {"trigger": "start_ingestion"}

    try:
        logger.info(f"Sending trigger event to Kinesis stream '{KINESIS_STREAM_NAME}'")
        response = client.put_record(
            StreamName=KINESIS_STREAM_NAME,
            Data=json.dumps(payload),
            PartitionKey="trigger"  # Simple partition key
        )
        logger.info(f"Kinesis put_record response: {response}")
        return {"status": "success", "message": "Trigger event sent to Kinesis."}
    except ClientError as e:
        logger.error(f"Failed to send trigger event to Kinesis: {e}", exc_info=True)
        return {"status": "error", "message": str(e)}
