# GCP Infrastructure Provisioning with Terraform (Homework 1)

#### This Terraform project provisions a foundational set of resources in a Google Cloud Platform (GCP) project. It is designed to be a starting point for creating a new environment and demonstrates how to manage multiple, distinct resources within a single Terraform configuration.

#### **Note**: This project is configured to use a GCS bucket for remote state storage. Please ensure you have created the state bucket and configured the backend.tf file before proceeding.

# Resources Created
#### This project will create the following resources in your GCP project:

#### 1. Google Cloud Storage (GCS) Bucket: A general-purpose storage bucket with versioning and deletion protection enabled.
#### 2. Google Compute Engine (VM) Instance: A small e2-micro virtual machine running Debian 11, suitable for testing and development.
#### 3. Google BigQuery Dataset: A new dataset in BigQuery, ready to store analytical data.

# Prerequisites

#### Before you begin, ensure you have the following installed and configured:

#### 1. Terraform: Install Terraform
#### 2. Google Cloud SDK: Install gcloud CLI
#### 3. Authentication: You must authenticate with GCP. The recommended method is to use Application Default Credentials (ADC):
#### 4. Enable APIs: Make sure the Compute Engine API and BigQuery API are enabled in your GCP project. Terraform will produce an error if they are not.


    gcloud auth application-default login

## Usage

#### Follow these steps to deploy the GCS bucket.

### Configure Environment Variables
#### This project requires your variables. The recommended way to provide this is by setting an environment variables in your terminal.

    export TF_VAR_project_id="your-gcp-project-id"

#### Replace "your-gcp-project-id" with your actual GCP Project ID.

### Deployment
#### From the root directory of this project, run the following commands:
    # Initialize the Terraform workspace to download providers
    terraform init

    # (Optional) Preview the resources that will be created
    terraform plan
    
    # Apply the configuration to create the GCS bucket
    terraform apply
