region = "us-east-2"

s3_bucket_name = "event-announcement-bucketv2"

# terraform.tfvars
lambda_subscribe_zip     = "lambda/subscribe/subscribe.zip"
lambda_create_event_zip  = "lambda/create-event/create-event.zip"


tags = {
  Project     = "EventAnnouncementSystem"
  Environment = "production"
}
