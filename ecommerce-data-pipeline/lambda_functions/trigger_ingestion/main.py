"""HTTP entry point for the Lambda function."""

# Standard Library
import json
import logging

# Third-party Libraries
import functions_framework
from flask import Request

# Internal Modules
from handler import handle_ingestion_request

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)

@functions_framework.http
def trigger_ingestion(request: Request):
    """
    HTTP-triggered Lambda function that triggers the ingestion pipeline
    by sending a trigger event to the Kinesis stream.

    Args:
        request (flask.Request): Incoming HTTP request.

    Returns:
        flask.Response: JSON response with status of the trigger operation.
    """
    logger.info("Received ingestion trigger request.")
    try:
        result = handle_ingestion_request()
        status_code = 200 if result["status"] == "success" else 500
    except Exception as e:
        logger.error(f"Error during ingestion trigger: {e}", exc_info=True)
        result = {"status": "error", "message": str(e)}
        status_code = 500
    return (json.dumps(result), status_code, {"Content-Type": "application/json"})
