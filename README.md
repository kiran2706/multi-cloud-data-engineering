# E-commerce Data Pipeline

A modern, cloud-native data pipeline that simulates an end-to-end e-commerce data platform using serverless technologies and open-source tools. This project demonstrates best practices in data engineering, from real-time ingestion to visualization.

## 🎯 Overview

This project implements a scalable data pipeline for e-commerce analytics, processing product data from public APIs through various stages of transformation and storage. The architecture leverages serverless technologies to minimize operational overhead while maintaining high performance and reliability.

## 🏗️ Architecture

[Insert architecture diagram here - Recommended to use draw.io or similar tool]

## 🔄 Pipeline Flow

1. **Data Ingestion**
   - HTTP-triggered AWS Lambda function fetches product data from FakeStore/DummyJSON API
   - Implements retry logic and error handling
   - Sends data to Amazon Kinesis stream

2. **Stream Processing**
   - Kinesis stream buffers incoming data
   - Consumer Lambda processes records in real-time
   - Stores raw data in S3/GCS
   - Optional: Updates DynamoDB/Firestore for fast lookups

3. **Batch Processing**
   - Databricks Community Edition runs daily PySpark jobs
   - Reads raw data from cloud storage
   - Applies transformations (cleaning, enrichment, aggregation)
   - Loads processed data into BigQuery

4. **Data Visualization**
   - Looker Studio connects to BigQuery
   - Creates interactive dashboards for business metrics
   - Enables self-service analytics

## 🛠️ Technology Stack

- **Cloud Services**
  - AWS Lambda (Python 3.9)
  - Amazon Kinesis
  - Amazon S3
  - Google BigQuery
  - Databricks Community Edition

- **Databases**
  - DynamoDB/Firestore (optional)
  - BigQuery

- **Development Tools**
  - Python 3.9+
  - PySpark
  - pytest
  - Docker (for local testing)

## 🚀 Getting Started

### Prerequisites

- AWS Account with appropriate permissions
- Google Cloud Account
- Databricks Community Edition account
- Python 3.9+ installed
- Docker (for local testing)