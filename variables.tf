variable "region" {
  default = "us-east-2"
}

variable "s3_bucket_name" {
  description = "Name for S3 bucket hosting website"
  type        = string
}

variable "sns_topic_name" {
  description = "SNS topic name"
  type        = string
  default     = "event-announcement-topic"
}

variable "lambda_subscribe_name" {
  description = "Lambda function name for subscribe"
  type        = string
  default     = "SubscribeHandler"
}

variable "lambda_create_event_name" {
  description = "Lambda function name for create event"
  type        = string
  default     = "CreateEventHandler"
}

variable "lambda_subscribe_zip" {
  description = "Path to zipped code for subscribe lambda"
  type        = string
}

variable "lambda_create_event_zip" {
  description = "Path to zipped code for create event lambda"
  type        = string
}

variable "api_name" {
  description = "API Gateway name"
  type        = string
  default     = "EventAnnouncementAPI"
}

variable "api_stage_name" {
  description = "API Gateway stage"
  type        = string
  default     = "prod"
}

variable "tags" {
  type    = map(string)
  default = {}
}
