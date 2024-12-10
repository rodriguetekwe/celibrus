
# Terraform S3 Bucket Module

This Terraform module sets up S3 buckets with support for GitHub Actions and cross-account access. It includes:
- S3 bucket provisioning with optional backend state management.
- DynamoDB table for state locking.
- IAM roles for GitHub Actions integration using OIDC.

## Features
- **Secure Cross-Account Access**: Automatically configures IAM roles and policies.
- **State Management**: Supports remote state storage in S3 and locking with DynamoDB.
- **GitHub Actions Integration**: Allows GitHub workflows to interact with AWS securely.

## Directory Structure
```
terraform-s3-file-storage/
├── .github/             # GitHub Actions workflows
├── examples/            # Example usage files
│   ├── backend.tfvars   # Backend configuration for remote state
│   ├── main.tf          # Example main file using the module
│   ├── terraform.tfvars # Example variables file
├── iam_roles.tf         # IAM roles for GitHub Actions OIDC
├── locals.tf            # Local variable definitions
├── provider.tf          # AWS provider configuration
├── remote.tf            # Backend and cross-account access configuration
├── variables.tf         # Input variables for the module
└── README.md            # Documentation
```

## Usage

### Example Deployment
1. Navigate to the `examples/` directory:
   ```bash
   cd examples
   ```

2. Initialize Terraform with the backend configuration:
   ```bash
   terraform init -backend-config=backend.tfvars
   ```

3. Validate the configuration:
   ```bash
   terraform validate
   ```

4. Plan the deployment:
   ```bash
   terraform plan -var-file=terraform.tfvars
   ```

5. Apply the changes:
   ```bash
   terraform apply -var-file=terraform.tfvars
   ```

### Inputs
| Variable       | Description                                      | Type          | Default |
|----------------|--------------------------------------------------|---------------|---------|
| `aws_accounts` | List of AWS account IDs                         | `list(string)`| N/A     |
| `github_org`   | GitHub organization for OIDC integration        | `string`      | N/A     |
| `github_repo`  | GitHub repository for OIDC integration          | `string`      | N/A     |

### Outputs
| Output                | Description                                  |
|-----------------------|----------------------------------------------|
| `s3_bucket_id`        | ID of the created S3 bucket                 |
| `dynamodb_table_name` | Name of the DynamoDB table for state locking|

## GitHub Actions Integration
The module includes predefined IAM roles to allow GitHub workflows to interact with AWS securely. Make sure to update the `github_org` and `github_repo` variables to match your project.

For more details, see the `.github/workflows/terraform.yml` file.

## Contributing
Feel free to open issues or submit pull requests to improve this module.

## License
This project is licensed under the MIT License.
