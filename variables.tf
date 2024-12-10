variable "aws_accounts" {
  description = "List of AWS account IDs where the IAM role should be created"
  type        = list(string)
  default     = ["011624006725"] # Replace with your account IDs
}

variable "bucket_name" {
  type = string
  default = "celibrus-terraform-state"
}

variable "dynamodb_table" {
  type = string
  default = "Dynamodb-celibrus-terraform"
}

variable "github_org" {
  description = "GitHub organization"
  type        = string
  default     = "rodriguetekwe" # Replace with your GitHub organization name
}

variable "github_repo" {
  description = "GitHub repository"
  type        = string
  default     = "celibrus" # Replace with your GitHub repository name
}