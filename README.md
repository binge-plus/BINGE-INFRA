# Binge+ Deployment on Google Cloud Platform

---

## Prerequisites

Before getting started, ensure you have the following in place:

- ✅ A **Google Cloud Platform account** with billing enabled.
- ✅ A **GCP project** created with a **project ID**.
- ✅ A **service account** with the :

  - **Required Permissions:**  

    - Artifact Registry Administrator
    - BigQuery Data Viewer
    - Cloud Run Viewer
    - Cloud SQL Viewer
    - Compute Admin
    - Compute Network Admin
    - Compute Storage Admin
    - Compute Viewer
    - Project IAM Admin
    - Pub/Sub Viewer
    - Service Account Admin
    - Service Account Key Admin
    - Storage Object Admin

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
    └── artifacts-registry/ # Artifact registry module with access controls
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
   - Configurable IAM access controls
   - Structured labeling for better resource management

4. **Key Management**
   - Service account key management with recommended manual rotation

## Deployment Instructions

You can deploy in two ways:

- ✅ Manually trigger the GitHub Actions Workflow  
- ✅ Commit any change to your repo (which will auto-trigger deployment)

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

## Step 2: Create a Service Account with Required Permissions

**In your Google Cloud SDK console:**

```bash
# Set your project ID
export PROJECT_ID="your-project-id"

# Create the service account
gcloud iam service-accounts create binge-plus-sa \
    --description="Service Account for Binge Plus application" \
    --display-name="Binge Plus Service Account"

# Assign the necessary roles to the service account
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/artifactregistry.admin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/bigquery.dataViewer"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/run.viewer"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/cloudsql.viewer"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.admin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.networkAdmin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.storageAdmin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.viewer"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/resourcemanager.projectIamAdmin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/pubsub.viewer"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/iam.serviceAccountAdmin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/iam.serviceAccountKeyAdmin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/storage.objectAdmin"

# Create and download a key for the service account
gcloud iam service-accounts keys create binge-plus-key.json \
    --iam-account=binge-plus-sa@$PROJECT_ID.iam.gserviceaccount.com
```

After creating the service account and downloading the key, add the contents of the `binge-plus-key.json` file to your GitHub repository secrets as `GCP_CREDENTIALS`.

---

## Step 3: Configure your variables

Update the values in `variables.tf` to match your environment:

- Project ID
- Region and zone
- Instance configuration
- SSH credentials

---

## Step 4: Push the Code to GitHub

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
5. Add automated artifact cleanup using Cloud Functions or scheduled jobs

---

## Conclusion

In this project, we've built a fully automated deployment pipeline using Terraform and GitHub Actions to spin up a GCP instance for hosting our website front end. With this Infrastructure as Code setup, we've created a repeatable, scalable, and version-controlled infrastructure setup with enhanced security features.