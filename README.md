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

This project aims to deploy a GCP instance named **binge-plus** to host the front end of our website using **Terraform**. The infrastructure is designed with security and maintainability in mind, using a modular approach that allows for easier updates and management.

## Repository Structure

This repository is organized as follows:

```
.
├── main.tf                # Main Terraform configuration
├── variables.tf           # Input variables
├── outputs.tf             # Output values
├── providers.tf           # Provider configuration
├── terraform.tf           # Terraform settings and version constraints
├── .github/
│   └── workflows/
│       └── terraform.yml  # GitHub Actions workflow for deployment
└── modules/
    ├── gcp_instance/      # GCP instance creation module
    ├── firewall/          # Firewall rules module (enhanced security)
    ├── service-account/   # Service account management module (least privilege)
    └── artifacts-registry/ # Artifact registry module (with cleanup policies)
```

## Security Enhancements

The infrastructure code has been improved with the following security features:

1. **Principle of Least Privilege** for service accounts
   - Separation of standard and admin roles
   - Admin roles disabled by default

2. **Enhanced Firewall Rules**
   - Grouping of common and application-specific rules
   - Restricted access to sensitive services (admin, databases)
   - Option for default-deny rule

3. **Artifact Registry Security**
   - Image cleanup policies to reduce attack surface
   - Configurable access controls

4. **Key Management**
   - Service account key management with recommended manual rotation

## Deployment Instructions

You can deploy in two ways:

- ✅ Manually trigger the GitHub Actions Workflow  
- ✅ Commit any change to your repo (which will auto-trigger deployment)

---

## Step A: Create a Cloud Storage bucket for your Terraform state file (tfstate)

**In your Google Cloud SDK console:**

```bash
gcloud auth login
gcloud config set project <your-project-id>
gcloud config set compute/region <your-region>
gcloud config set compute/zone <your-zone>
gsutil mb -p <your-project-id> gs://<your-bucket-name>
```

---

## Step 2: Configure your variables

Update the values in `variables.tf` to match your environment:

- Project ID
- Region and zone
- Instance configuration
- SSH credentials

---

## Step 3: Push the Code to GitHub

Once your changes are ready:

- Commit and push your Terraform code to your GitHub repository.  
- Ensure the required secrets are added as described in the **Prerequisites** section.

---

## Future Improvements

Planned enhancements for the infrastructure (upcoming in 10-15 days):

1. Update the GCP instance module with additional security features
2. Implement data backup and recovery mechanisms
3. Add monitoring and alerting
4. Implement more granular access controls

---

## Conclusion

In this project, we've built a fully automated deployment pipeline using Terraform and GitHub Actions to spin up a GCP instance for hosting our website front end. With this Infrastructure as Code setup, we've created a repeatable, scalable, and version-controlled infrastructure setup with enhanced security features.