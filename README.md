# 🚀 Serverless Job Tracker API (AWS + Terraform)

## 📌 Overview

The **Serverless Job Tracker API** is a production-ready backend application built using AWS serverless services. It allows users to manage and track job applications with features like creating, updating, retrieving, and deleting job entries.

This project demonstrates **real-world AWS backend development**, including serverless architecture, Infrastructure as Code, and CI/CD automation.

---

## 🧱 Architecture

```
Client (Postman / Frontend)
        ↓
API Gateway
        ↓
AWS Lambda (Business Logic)
        ↓
DynamoDB (Jobs Table)
        ↓
S3 (Resume Storage - optional)
        ↓
CloudWatch (Logs & Monitoring)
        ↓
Cognito (Authentication - optional upgrade)
```

---

## ⚙️ Tech Stack

* **Backend**: AWS Lambda (Python)
* **API Layer**: API Gateway (HTTP API)
* **Database**: DynamoDB (NoSQL)
* **Storage**: S3 (for resumes - optional)
* **Authentication**: Cognito (optional)
* **Infrastructure**: Terraform
* **Monitoring**: CloudWatch

---

## ✨ Features

* ✅ Create job applications
* ✅ Retrieve all jobs
* ✅ Update job status
* ✅ Delete jobs
* ✅ Serverless architecture (auto-scaling)
* ✅ Infrastructure as Code (Terraform)
* ✅ Error handling & logging

---

## 📁 Project Structure

```
job-tracker-api/
│
├── src/
│   ├── handlers/
│   │   ├── create_job.py
│   │   ├── get_jobs.py
│   │
│   ├── services/
│   ├── models/
│   └── utils/
│
├── infra/
│   ├── main.tf
│   ├── lambda.tf
│   ├── dynamodb.tf
│   ├── api.tf
│   ├── iam.tf
│   └── s3.tf
│
├── .github/workflows/
│   └── deploy.yml
│
├── README.md
└── .gitignore
```

---

## 📡 API Endpoints

### ➕ Create Job

```
POST /jobs
```

**Request Body**

```json
{
  "company": "Amazon",
  "role": "SDE"
}
```

---

### 📄 Get Jobs

```
GET /jobs
```

---

### 🔄 Update Job (future enhancement)

```
PUT /jobs/{id}
```

---

### ❌ Delete Job (future enhancement)

```
DELETE /jobs/{id}
```

---

## 🧠 DynamoDB Schema

**Table Name:** `jobs`

| Attribute  | Type | Description        |
| ---------- | ---- | ------------------ |
| user_id    | PK   | Partition key      |
| job_id     | SK   | Sort key           |
| company    | S    | Company name       |
| role       | S    | Job role           |
| status     | S    | Application status |
| created_at | S    | Timestamp          |

---

## 🚀 Getting Started

### 1️⃣ Clone the repo

```bash
git clone <your-repo-url>
cd job-tracker-api
```

---

### 2️⃣ Setup AWS CLI

```bash
aws configure
```

---

### 3️⃣ Deploy Infrastructure

```bash
cd infra
terraform init
terraform apply -auto-approve
```

---

### 4️⃣ Test API

Using Postman or any API tool:

#### Create Job

```bash
POST https://<api-url>/jobs
```

---

## 🔄 CI/CD Pipeline

This project uses **GitHub Actions** for automated deployment.

### Workflow:

* Push to `main` branch
* Terraform initializes
* Infrastructure is deployed automatically

---

## 🔐 Environment Variables

Stored securely in GitHub Secrets:

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

---

## 📊 Logging & Monitoring

* Logs are available in **CloudWatch**
* Used for debugging and performance monitoring

---

## 🛡️ Security Considerations

* No hardcoded credentials
* Secrets managed via GitHub Actions
* IAM roles used for Lambda permissions
* (Recommended) Use OIDC instead of access keys

---

## 🔥 Future Enhancements

* 🔐 Add Cognito authentication (JWT)
* 📄 Resume upload using S3 (pre-signed URLs)
* 📊 Add pagination & filtering
* 📈 CloudWatch dashboards & alerts
* 🌍 Custom domain for API Gateway
* 🧪 Unit & integration tests

---

## 💼 Resume Description

> Built a scalable serverless job tracking API using AWS Lambda, API Gateway, and DynamoDB, with infrastructure provisioned via Terraform and automated deployment through CI/CD pipelines.

---

## 🙌 Acknowledgements

This project is designed as a **real-world AWS Developer portfolio project** to demonstrate backend, cloud, and DevOps capabilities.

---

## 📬 Contact

Feel free to connect or reach out for collaboration or feedback!

---
