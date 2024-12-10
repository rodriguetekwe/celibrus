
bucket         = "terraform-state-shared-bucket"
key            = "terraform-state/terraform.tfstate"
region         = "us-east-1"
dynamodb_table = "terraform-state-lock"
encrypt        = true
