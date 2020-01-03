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

  // version を data で引っ張ってこれなかった ($LATEST というエイリアスが降ってくる)
  // なので直接指定している
  basic_auth_function_name    = "lambda-edge-basic-auth"
  basic_auth_function_version = "1"
}
