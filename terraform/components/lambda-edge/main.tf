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
  function_name = "lambda-edge-basic-auth"
  handler       = "lambda.basicAuth"
  runtime       = "nodejs10.x"
}

