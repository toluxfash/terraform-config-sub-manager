# Subscription Management App Infrastructure (Terraform)

This project provisions the AWS infrastructure required to run a subscription management application.  
It uses Terraform to create a production-ready environment with networking, compute, storage, and database resources.

---

## 📌 Architecture

The infrastructure is composed of the following components:

- **VPC & Networking** (`vpc.tf`)  
  - Creates a VPC (`10.0.0.0/16`) with:
    - 2 Public Subnets (`10.0.1.0/24`, `10.0.2.0/24`)
    - 2 Private Subnets (`10.0.3.0/24`, `10.0.4.0/24`)
    - Internet Gateway and public route table associations  

- **Application Load Balancer & Auto Scaling Group** (`alb_asg.tf`)  
  - Application Load Balancer (ALB) in the public subnets  
  - Target group & listener (HTTP :80 → app port `3001`)  
  - Auto Scaling Group of EC2 instances (based on Launch Template)  

- **Security Groups** (`security_group.tf`)  
  - Allows SSH (22), HTTP (80), React Dev Server (5173), and App traffic (3001)  
  - Open egress to the internet  

- **Database (RDS)** (`rds.tf`)  
  - Managed PostgreSQL/MySQL instance (based on variables)  
  - Runs in the private subnets  
  - Access restricted to application security group  

- **S3 Bucket (Optional)** (`s3.tf`)  
  - Configured but commented out — can be enabled for storing receipts  

---

## 📂 Project Structure

```bash

terraform-config/
├── main.tf              # Root module, calls submodules
├── variables.tf         # Input variable definitions
├── terraform.tfvars     # Example variable values
├── terraform.tfstate    # Local Terraform state (do not commit)
├── modules/             # Infrastructure modules
│   ├── alb_asg.tf       # Load balancer + auto scaling group
│   ├── ec2.tf           # (Optional) standalone EC2, currently disabled
│   ├── outputs.tf       # Exported resource outputs
│   ├── provider.tf      # AWS provider configuration
│   ├── rds.tf           # RDS database instance
│   ├── s3.tf            # Optional S3 bucket
│   ├── security_group.tf# Security groups
│   ├── variable.tf      # Module-level variables
│   └── vpc.tf           # Networking resources

```

---

## ⚡ Prerequisites

- **Terraform** v1.12.2 or later  
- **AWS Account** with sufficient permissions (EC2, RDS, VPC, IAM, S3, ALB)  
- **AWS CLI** configured with a profile (default: `personal`)  
- **SSH Key Pair** already created in AWS (must match `key_name` in `terraform.tfvars`)

---

## 🔧 Usage

1. Clone this repository:
   ```bash
   git clone <repo-url>
   cd terraform-config

2. Initialize Terraform:
   ```bash
   terraform init

3. Review the plan:
    ```bash
    terraform plan
4. Apply changes:
    ```bash
    terraform apply
5. Destroy resources (when no longer needed):
    ```bash
    terraform destroy

## 📤 Outputs
After `terraform apply`, the following outputs may be provided (check `outputs.tf`):
- **ALB DNS Name** – URL to access the application  
- **RDS Endpoint** – Database connection string  
- **VPC ID / Subnet IDs** – Networking resource identifiers  

---

## 🔒 Notes
- State is currently stored locally (`terraform.tfstate`). For team use, configure a remote backend (S3 + DynamoDB).  
- Security groups allow wide access (`0.0.0.0/0`) — restrict in production.  
- S3 module is disabled by default — uncomment in `s3.tf` to enable.  

---

## 📖 Next Steps
- Add monitoring (CloudWatch / Prometheus)  
- Add CI/CD pipeline (GitHub Actions / GitLab CI)  
- Migrate state to S3 backend for team collaboration  

---

## 🧑‍💻 Author
DevOps Engineer — Subscription Management Project

## 🏗️ Architecture Diagram

```mermaid
graph TD
    A[Internet] -->|HTTP/SSH| B[Application Load Balancer]
    B -->|Forward to| C[Auto Scaling Group - EC2 Instances]
    C -->|Reads/Writes| D[(RDS Database)]
    C -->|Optional| E[(S3 Bucket)]
    
    subgraph VPC
        B
        C
        D
        E
    end

    subgraph Public Subnets
        B
        C
    end

    subgraph Private Subnets
        D
        E
    end
