output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID (for GitHub Actions variable)"
  value       = aws_cloudfront_distribution.website.id
}

output "cloudfront_domain" {
  description = "CloudFront domain — point your domain to this in Squarespace DNS"
  value       = aws_cloudfront_distribution.website.domain_name
}

output "s3_bucket_name" {
  description = "S3 bucket for website content (for GitHub Actions variable)"
  value       = aws_s3_bucket.website.id
}

output "deploy_access_key_id" {
  description = "AWS_ACCESS_KEY_ID for GitHub Actions secret"
  value       = aws_iam_access_key.deploy.id
}

output "deploy_secret_access_key" {
  description = "AWS_SECRET_ACCESS_KEY for GitHub Actions secret"
  value       = aws_iam_access_key.deploy.secret
  sensitive   = true
}

output "acm_validation_records" {
  description = "Add these CNAME records in Squarespace to validate the certificate"
  value = {
    for dvo in aws_acm_certificate.main.domain_validation_options : dvo.domain_name => {
      type  = dvo.resource_record_type
      name  = dvo.resource_record_name
      value = dvo.resource_record_value
    }
  }
}
