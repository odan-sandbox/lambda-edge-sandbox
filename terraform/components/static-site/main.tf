terraform {
  required_version = ">= 0.12.0"

  backend "s3" {
    region = "ap-northeast-1"
  }
}


provider "aws" {
  region = "ap-northeast-1"
}

module "static-site" {
  source = "../../modules/static-site"

  bucket_name = "odan-lambda-edge-sandbox"

  basic_auth_function_name    = "lambda-edge-basic-auth"
  basic_auth_function_version = "1"
}
