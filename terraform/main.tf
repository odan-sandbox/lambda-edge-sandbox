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
  source = "./static-site"

  bucket_name = "odan-lambda-edge-sandbox"
}
