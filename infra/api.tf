resource "aws_apigatewayv2_api" "api" {
  name          = "job-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "create_job" {
  api_id           = aws_apigatewayv2_api.api.id
  integration_type = "AWS_PROXY"
  integration_uri  = aws_lambda_function.create_job.invoke_arn
}

resource "aws_apigatewayv2_integration" "get_jobs" {
  api_id           = aws_apigatewayv2_api.api.id
  integration_type = "AWS_PROXY"
  integration_uri  = aws_lambda_function.get_jobs.invoke_arn
}

resource "aws_apigatewayv2_route" "post_jobs" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /jobs"
  target    = "integrations/${aws_apigatewayv2_integration.create_job.id}"
}

resource "aws_apigatewayv2_route" "get_jobs" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /jobs"
  target    = "integrations/${aws_apigatewayv2_integration.get_jobs.id}"
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.api.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_lambda_permission" "post_jobs" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create_job.function_name
  principal     = "apigateway.amazonaws.com"
  # Use execution_arn from the apigatewayv2_api for specific access
  source_arn = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}

resource "aws_lambda_permission" "get_jobs" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_jobs.function_name
  principal     = "apigateway.amazonaws.com"
  # Use execution_arn from the apigatewayv2_api for specific access
  source_arn = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}

