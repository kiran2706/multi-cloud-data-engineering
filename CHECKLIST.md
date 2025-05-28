# E-Commerce Data Engineering Project – Work Checklist

Legend:
⬜ = Not Started | 🟨 = In Progress | ✅ = Completed

## 🔧 Core Pipeline Setup

| Task | Status |
|------|--------|
| 🟨 Set up AWS account with billing alerts | |
| 🟨 Setup Terraform and connect AWS CLI | |
| ⬜ Enable API Gateway / HTTP trigger | |
| 🟨 Create AWS Lambda (trigger_ingestion) | |
| 🟨 Create Kinesis Data Stream | |
| ⬜ Publish data to Kinesis stream | |
| ⬜ Create Lambda (fetch_product_data) triggered by Kinesis | |
| ⬜ Fetch product data from public API | |
| ⬜ Store raw data in S3 | |
| ⬜ Trigger Lambda by event | |
| ⬜ Store transformed data in DynamoDB or Firestore | |
| ⬜ Prepare BigQuery table for final analytics | |
| ⬜ Load transformed data to BigQuery | |

## 🧪 Testing & Dev Tools

| Task | Status |
|------|--------|
| ⬜ Write unit tests for ingestion Lambda | |
| ⬜ Mock API and Kinesis with moto / botocore.stub | |
| ⬜ Write tests for transformation Lambda | |
| ⬜ Add pytest setup and coverage config | |
| ⬜ Add .env.example for local testing | |
| ⬜ Add logging and error tracking in Lambdas | |

## 🗃️ Data Sources & Storage

| Task | Status |
|------|--------|
| ⬜ Select & document product API (FakeStore/DummyJSON/etc.) | |
| ⬜ Design schema for raw and structured product data | |
| ⬜ Create S3 bucket for raw zone | |
| ⬜ Set up DynamoDB or Firestore for NoSQL lookup | |
| ⬜ Create BigQuery dataset + tables | |

## ⚙️ Batch & Transformation (Databricks)

| Task | Status |
|------|--------|
| ⬜ Register Databricks CE account | |
| ⬜ Upload raw data files to Databricks | |
| ⬜ Create PySpark job to clean/transform raw data | |
| ⬜ Load clean data into BigQuery | |
| ⬜ Add test data and verify transformations | |

## 📊 Analytics & Dashboards

| Task | Status |
|------|--------|
| ⬜ Connect Looker Studio to BigQuery | |
| ⬜ Build simple sales/product dashboard | |
| ⬜ Create metrics: Top categories, cheapest products, price tracking | |
| ⬜ Add refresh schedules (e.g. every 6 hours) | |

## 🚀 Deployment & Orchestration (Optional)

| Task | Status |
|------|--------|
| ⬜ Write Terraform / CDK / SAM for infra setup | |
| ⬜ Add GitHub Actions for CI testing | |
| ⬜ Document manual deploy instructions in README | |
| ⬜ Schedule batch jobs using Cloud Scheduler or Airflow | | 