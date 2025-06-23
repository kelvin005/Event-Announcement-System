output "lambda_function_arn" {
  value = aws_lambda_function.lambda_func.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.lambda_func.function_name
}
