provider "aws" {
  # Configuration options
  region     = "ap-south-1"
  # access_key = var.access_key
  # secret_key = var.secret_key
}

terraform {
  backend "s3" {
    bucket = "amod-terraform"
    region = "ap-south-1"
    key = "terraform.tfstate"
    # dynamodb_table = "state-lock"
  }
}