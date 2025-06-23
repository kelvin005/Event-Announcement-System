terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " >= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "s3_website" {
  source      = "./s3"
  bucket_name = var.s3_bucket_name
  tags        = var.tags
}

module "sns" {
  source     = "./sns"
  topic_name = var.sns_topic_name
  tags       = var.tags
}

module "lambda_subscribe" {
  source               = "./lambda"
  function_name        = var.lambda_subscribe_name
  handler              = "index.subscribeHandler"
  runtime              = "nodejs16.x"
  zip_file             =  "${path.root}/${var.lambda_subscribe_zip}"

  sns_publish_arn      = module.sns.sns_topic_arn
  environment_variables = {
    SNS_TOPIC_ARN = module.sns.sns_topic_arn
  }
  tags = var.tags
}

module "lambda_create_event" {
  source               = "./lambda"
  function_name        = var.lambda_create_event_name
  handler              = "index.createEventHandler"
  runtime              = "nodejs16.x"
  zip_file             = "${path.module}/${var.lambda_create_event_zip}"
  sns_publish_arn      = module.sns.sns_topic_arn
  environment_variables = {
    SNS_TOPIC_ARN = module.sns.sns_topic_arn
  }
  tags = var.tags


  
}

module "api_gateway" {
  source                   = "./api-gateway"
  api_name                 = var.api_name
  subscribe_lambda_arn     = module.lambda_subscribe.lambda_function_arn
  create_event_lambda_arn  = module.lambda_create_event.lambda_function_arn
  subscribe_lambda_name    = module.lambda_subscribe.lambda_function_name
  create_event_lambda_name = module.lambda_create_event.lambda_function_name
  stage_name               = var.api_stage_name
  tags                     = var.tags
}

# output "website_url" {
#   value = "http://${module.s3_website.website_endpoint}"
# }

# output "api_url" {
#   value = module.api_gateway.api_invoke_url
# }

# output "sns_topic_arn" {
#   value = module.sns.sns_topic_arn
# }
