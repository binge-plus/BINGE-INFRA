# Binge+ Deployment on Google Cloud Platform

## Overview

This project aims to deploy a GCP instance named **binge-plus** to host the front end of our website using **Terraform**, an Infrastructure as Code (IaC) tool that allows us to create and manage cloud infrastructure using code. We are setting up our deployment pipeline so that it can be executed directly from our GitHub repository without the need for local installations or manual authentication.

The project will be deployed on the Google Cloud Platform (GCP) using Terraform, which allows us to define and manage our infrastructure as code.

## Project Setup

In this initial step of our project, we will:

1. Create a Terraform script that spins up a GCP instance.
2. Define multiple firewall rules to facilitate our deployment process.
3. Set up a GitHub Actions workflow to automate the deployment.

## Why Terraform?

Terraform is a powerful tool that helps us manage infrastructure using code. With Terraform, we can automate the creation of our cloud resources, making it easier to:

- Spin up and tear down environments quickly.
- Maintain consistency across different environments.
- Version control our infrastructure alongside our application code.

## Prerequisites

Before getting started, ensure you have the following:

- A Google Cloud Platform account with appropriate permissions.
- You will need to create a service account with the necessary permissions and its credentials JSON file.
- Terraform installed on your machine for testing it locally
- A GitHub repository for your project.
- A GCP project ID, region, and zone for deployment.
- Familiarity with Terraform and its syntax.
- Familiarity with GitHub Actions and its syntax.

## Step 1: Create a Cloud Storage for storing tfstate file for acquiring lock state

## OPEN YOUR GOOGLE CLOUD SDK CONSOLE:
- gcloud auth login in your google command sdk console in your system
- gcloud config set project <your-project-id>
- gcloud config set compute/region <your-region>
- gcloud config set compute/zone <your-zone>
- gsutil mb -p <your-project-id> gs://<Your-Bucket-Name>

## Step 2: Clone the project to make changes according to you needs:

- instance name
- instance type
- region (Add this in github secrets)
- zone (Add this in github secrets)
- ssh-key   (Add this in github secrets)
- ssh-username (Add this in github secrets)
- firewall ports and names that you will use in this Project
- NOTE: -- Do not change workflow file as it is perfectly balanced with your project hierarchy, even if you change your  specifications.

## Step 3: Push Your code to your github account

- Add SECRETS in GITHUB SECRETS
- GCP_CREDENTIALS --> it contains your service account json content
- GCP_PROJECT_ID --> project id for making Authentication between github and GCP account
- GCP_REGION, GCP_ZONE, 
- SSH_PUBLIC_KEY --> to ssign a ssh key to your server
- SSH_USERNAME --> to create a user (Here "binge+" is user)

## Step 4: Run the Code
- By manually Triggering Workflow
- By Commiting changes in your project

# Key Accomplishments:
1. Automated Deployment: The integration of Terraform with GitHub Actions allows for automated deployments directly from our repository, eliminating the need for local installations or manual authentication.
2. Firewall Management: We have defined firewall rules that simplify port management, ensuring that our application can communicate effectively without requiring constant updates to firewall settings.
3. Scalability and Flexibility: By configuring the Terraform scripts and using GitHub Secrets, we can easily adapt the deployment settings to meet changing requirements, such as instance types, regions, and firewall rules.

# Conclusion
- In this project, we have successfully set up a deployment pipeline to create a Google Cloud Platform (GCP) instance named binge-plus using Terraform. By leveraging Infrastructure as Code, we have streamlined the process of managing our cloud resources, allowing us to easily define and modify our infrastructure without manual intervention.

- By automating our deployment process and adopting best practices in infrastructure management, we are well on our way to creating a robust and scalable hosting environment for our website. Thank you for following along with the Binge+ project! 
