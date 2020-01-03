provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}

data "aws_iam_policy_document" "lambda-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com", "edgelambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda-edge" {
  name = "lambda-edge"

  assume_role_policy = data.aws_iam_policy_document.lambda-assume-role.json
}

resource "aws_iam_role_policy_attachment" "lambda-edge" {
  role       = aws_iam_role.lambda-edge.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "lambda" {
  provider = aws.virginia

  function_name = var.function_name
  handler       = var.handler

  filename         = var.filename
  source_code_hash = filebase64sha256(var.filename)

  role = aws_iam_role.lambda-edge.arn

  runtime = var.runtime

  publish = true
}
