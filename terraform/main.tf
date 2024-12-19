# S3 Bucket in Account 3
module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  bucket = var.bucket_name
  block_public_policy = true
  block_public_acls = true
  restrict_public_buckets= true
  ignore_public_acls  = true

  # website = {
  #   index_document = "index.html"
  #   error_document = "error.html"
  # }

  # cors_rule = [
  #   {
  #   allowed_headers = ["*"]
  #   allowed_methods = ["PUT", "POST"]
  #   allowed_origins = ["https://s3-website-test.hashicorp.com"]
  #   expose_headers  = ["ETag"]
  #   max_age_seconds = 3000
  # }
  # ]

  attach_policy  = true
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
                "AWS": "arn:aws:iam::011624006725:user/Awom-Rodrigue"
            }
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })

}