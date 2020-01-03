terraform {
  required_version = ">= 0.12.0"

  backend "s3" {
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "../../../lambda-edge/dist/"
  output_path = "./dist.zip"
}

module "lambda-edge" {
  source = "../../modules/lambda-edge"

  filename      = data.archive_file.lambda.output_path
  function_name = "basic_auth"
  handler       = "lambda.basic_auth"
  runtime       = "nodejs10.x"
}

