output "website_url" {
  description = "URL of S3 static website"
  value       = "http://${module.s3_website.website_endpoint}"
}

output "api_url" {
  description = "API Gateway invoke URL"
  value       = module.api_gateway.api_invoke_url
}

output "sns_topic_arn" {
  description = "SNS Topic ARN"
  value       = module.sns.sns_topic_arn
}
