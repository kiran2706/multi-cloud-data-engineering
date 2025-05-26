# trigger_ingestion Lambda 😊

## Overview

This AWS Lambda function is triggered via HTTP (API Gateway or direct HTTP request). It sends a simple trigger message to an Amazon Kinesis stream to start the ingestion pipeline. 🚀
---

## Setup and Configuration 🔧

1. **Set environment variable**

Set the Kinesis stream name in your environment before running or deploying:

```bash
export KINESIS_STREAM_NAME=your-kinesis-stream-name
```

2. **Install dependencies**

```bash
pip install -r requirements.txt
```

---

## Running Locally 🖥️

You can run the function locally with the Functions Framework:

```bash
functions-framework --target=trigger_ingestion --debug
```

The function will listen on port 8080 by default. 📍

---

## Testing 🧪

You can test the function locally by sending an HTTP POST request:

```bash
curl -X POST http://localhost:8080/
```

---

## Deployment ☁️

Deploy this Lambda using your preferred method (AWS CLI, SAM, Terraform, etc.) with the appropriate environment variables set.

Ensure that the Lambda has IAM permissions to put records to the configured Kinesis stream. 🔐

---

## Logging and Error Handling ⚠️

- Uses Python's logging module to log info and errors.
- Returns HTTP 500 on failures, with error details in the JSON response.

---

## Notes 📝

- This Lambda **does not** fetch data from the public API directly.
- It only pushes a trigger event to Kinesis.
- Another Lambda (Kinesis consumer) is responsible for fetching and processing the data. 👍