# Outputs the S3 bucket name
output "s3_bucket_name" {
  description = "The name of the created S3 bucket"
  value       = module.s3_bucket_example.s3_bucket_id
}

# Outputs the DynamoDB table name used for state locking
output "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for Terraform state locking"
  value       = module.s3_bucket_example.dynamodb_table_name
}

# Outputs the website endpoint if static website hosting is enabled
output "s3_website_endpoint" {
  description = "The URL of the S3 static website endpoint"
  value       = module.s3_bucket_example.website_endpoint
}

# Outputs the IAM role ARNs created for GitHub Actions OIDC integration
output "iam_role_arns" {
  description = "List of ARNs for the IAM roles created for GitHub Actions in AWS accounts"
  value       = [
    aws_iam_role.github_oidc_role_account1.arn,
    aws_iam_role.github_oidc_role_account2.arn,
  ]
}

# Outputs the cross-account S3 bucket policy
output "s3_bucket_policy" {
  description = "The policy applied to the S3 bucket for cross-account access"
  value       = aws_s3_bucket_policy.s3_cross_account_access.policy
}
