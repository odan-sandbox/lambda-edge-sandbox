provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}

data "aws_lambda_function" "basic_auth" {
  provider = aws.virginia

  function_name = var.basic_auth_function_name
}
