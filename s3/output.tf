output "website_endpoint" {
  value = aws_s3_bucket.website.website_endpoint
}

output "bucket_name" {
  value = aws_s3_bucket.website.bucket
}

output "website_url" {
  value = "http://${aws_s3_bucket.website.bucket}.s3-website.${var.region}.amazonaws.com"
}

