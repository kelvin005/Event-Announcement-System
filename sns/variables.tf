variable "topic_name" {
  type        = string
  description = "Name of the SNS topic"
}

variable "tags" {
  type    = map(string)
  default = {}
}
