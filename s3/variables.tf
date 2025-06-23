variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "tags" {
  type    = map(string)
  default = {}
}
variable "region" {
  type        = string
  description = "AWS region where the S3 bucket will be created"
  default     = "us-east-2"
}
