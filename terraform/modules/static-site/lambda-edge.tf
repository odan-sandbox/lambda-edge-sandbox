provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}

data "aws_lambda_function" "basic_auth" {
  // lambda edge は virginia にある前提なので指定する
  provider = aws.virginia

  function_name = var.basic_auth_function_name
}
