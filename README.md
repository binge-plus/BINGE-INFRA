# Binge+ Deployment on Google Cloud Platform

---

## Prerequisites

Before getting started, ensure you have the following in place:

- ✅ A **Google Cloud Platform account** with billing enabled.
- ✅ A **GCP project** created with a **project ID**.
- ✅ A **service account** with the :

  - **Required Permissions:**  
    - Artifact Registry Admin  
    - BigQuery Data Viewer  
    - Run Viewer  
    - Cloud SQL Viewer  
    - Compute Storage Admin  
    - Compute Viewer  
    - Pub/Sub Viewer  
    - Storage Object Admin  
    - IAM Service Account Admin
    - Project IAM Admin

- ✅ The **JSON key** file for the service account.
- ✅ **Terraform** installed locally (for local testing/debugging).
- ✅ A **GitHub repository** to host your code and workflows.
- ✅ The following **GitHub secrets** added to your repo:
  - `GCP_CREDENTIALS` → Contents of your service account JSON key file
  - `GCP_PROJECT_ID` → Your GCP project ID

---

## Overview

This project aims to deploy a GCP instance named **binge-plus** to host the front end of our website using **Terraform**, an Infrastructure as Code (IaC) tool that allows us to create and manage cloud infrastructure using code. We are setting up our deployment pipeline so that it can be executed directly from our GitHub repository without the need for local installations or manual authentication.

---

## Why Terraform?

Terraform is a powerful tool that helps us manage infrastructure using code. With Terraform, we can automate the creation of our cloud resources, making it easier to:

- Spin up and tear down environments quickly.  
- Maintain consistency across different environments.  
- Version control our infrastructure alongside our application code.

## Project Setup

In this initial step of our project, we will:

1. Create a Terraform script that spins up a GCP instance.  
2. Define multiple firewall rules to facilitate our deployment process.  
3. spin up an Artifact Registry repository.
4. Set up a GitHub Actions workflow to automate the deployment.

---

## Step 1: Create a Cloud Storage bucket for your Terraform state file (tfstate)

**In your Google Cloud SDK console:**

```bash
gcloud auth login
gcloud config set project <your-project-id>
gcloud config set compute/region <your-region>
gcloud config set compute/zone <your-zone>
gsutil mb -p <your-project-id> gs://<your-bucket-name>
```

---

## Step 2: Clone the Project and Make Necessary Modifications

Update the following:

- Instance name  
- Machine type (e.g., `e2-medium`)  
- Firewall rules and ports
- Artifact Registry name and description

> ⚠️ **Note:** Do not modify the GitHub Actions workflow unless absolutely necessary. It is already configured for your project hierarchy.

---

## Step 3: Push the Code to GitHub

Once your changes are ready:

- Commit and push your Terraform code to your GitHub repository.  
- Ensure the required secrets are added as described in the **Prerequisites** section.

---

## Step 4: Trigger Deployment

You can deploy in two ways:

- ✅ Manually trigger the GitHub Actions Workflow  
- ✅ Commit any change to your repo (which will auto-trigger deployment)

- ![image](https://github.com/user-attachments/assets/42d86201-497f-44d9-97bd-c59d43117d2c)


---

## Key Accomplishments

1. **Automated Deployment** – Seamless CI/CD pipeline using GitHub Actions + Terraform  
2. **Firewall Management** – Port access is defined and handled through Terraform  
3. **Scalable Infrastructure** – Easy to adjust regions, machine types, and more by simply updating the Terraform configuration

---

## Conclusion

In this project, we’ve built a fully automated deployment pipeline using Terraform and GitHub Actions to spin up a GCP instance for hosting our website front end. With this Infrastructure as Code setup, we’ve created a repeatable, scalable, and version-controlled infrastructure setup.