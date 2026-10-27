# terraform-v2

A small Terraform project that launches an AWS EC2 instance and stores its state in a remote S3 backend.

## What it creates

| Resource | Details |
| --- | --- |
| `aws_instance.terraform_server` | `t3.micro` instance in `ap-south-1`, tagged `Name = Terraform_Demo` |

The instance uses an existing AMI, subnet, and key pair (`default-new`), all set in `main.tf`.

## Remote state

State is kept in S3 (see `backend.tf`):

- **Bucket:** `27102026-be-tf-noman`
- **Key:** `noman-tf/terraform.tfstate`
- **Region:** `ap-south-1`

The bucket must exist before you run `terraform init`.

## Requirements

- Terraform `>= 1.15.5`
- AWS provider `~> 6.0`
- AWS credentials with access to EC2 and the state bucket (for example via `aws configure` or environment variables)

## Usage

```bash
terraform init      # download the provider and connect to the S3 backend
terraform plan      # preview the changes
terraform apply     # create the EC2 instance
terraform destroy   # remove it when you're done
```

## Files

| File | Purpose |
| --- | --- |
| `main.tf` | Provider settings and the EC2 instance |
| `backend.tf` | S3 backend configuration |
| `.terraform.lock.hcl` | Locked provider versions |
| `.gitignore` | Keeps state, `.terraform/`, tfvars, and keys out of Git |
