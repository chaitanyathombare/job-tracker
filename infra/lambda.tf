resource "aws_lambda_function" "create_job" {
  function_name = "create_job"
  handler       = "create_job.handler"
  runtime       = "python3.11"
  role          = aws_iam_role.lambda_role.arn

  filename         = "../src/handlers/create_job.zip"
  source_code_hash = filebase64sha256("../src/handlers/create_job.zip")
}

resource "aws_lambda_function" "get_jobs" {
  function_name = "get_jobs"
  handler       = "get_jobs.handler"
  runtime       = "python3.11"
  role          = aws_iam_role.lambda_role.arn

  filename         = "../src/handlers/get_jobs.zip"
  source_code_hash = filebase64sha256("../src/handlers/get_jobs.zip")
}


