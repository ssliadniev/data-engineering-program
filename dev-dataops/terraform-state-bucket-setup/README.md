# Terraform GCS Backend Bucket Setup

#### This Terraform project creates a secure Google Cloud Storage (GCS) bucket designed specifically to be used as a remote backend for storing Terraform state files.

#### Using a remote GCS bucket is a foundational best practice for working with Terraform in a team, as it provides a single source of truth, state locking to prevent conflicts, and keeps sensitive information off local machines.

# Prerequisites

#### Before running this code, you must have the following installed and configured:

#### 1. Terraform: Install Terraform
#### 2. Google Cloud SDK: Install gcloud CLI
#### 3. Authentication: You must authenticate with GCP. The recommended method is to use Application Default Credentials (ADC):


    gcloud auth application-default login

## Usage

#### Follow these steps to deploy the GCS bucket.

### 1. Configure Environment Variables
#### This project requires your Google Cloud Project ID. The recommended way to provide this is by setting an environment variable in your terminal.

    export TF_VAR_project_id="your-gcp-project-id"

#### Replace "your-gcp-project-id" with your actual GCP Project ID.

### 2. Run Terraform Commands
#### From the root directory of this project, run the following commands:
    # Initialize the Terraform workspace to download providers
    terraform init

    # (Optional) Preview the resources that will be created
    terraform plan
    
    # Apply the configuration to create the GCS bucket
    terraform apply
