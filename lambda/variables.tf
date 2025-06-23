variable "function_name" {
  type = string
}

variable "handler" {
  type = string
}

variable "runtime" {
  type    = string
  default = "nodejs18.x"
}

variable "zip_file" {
  type = string
}

variable "environment_variables" {
  type    = map(string)
  default = {}
}

variable "sns_publish_arn" {
  type    = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
