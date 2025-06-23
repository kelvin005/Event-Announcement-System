variable "api_name" {
  type = string
}

variable "subscribe_lambda_arn" {
  type = string
}

variable "create_event_lambda_arn" {
  type = string
}

variable "subscribe_lambda_name" {
  type = string
}

variable "create_event_lambda_name" {
  type = string
}

variable "stage_name" {
  type    = string
  default = "prod"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "region" {
  type        = string
  description = "AWS region where the API Gateway will be created"
  default     = "us-east-2"
}
