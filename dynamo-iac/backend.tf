terraform {
  backend "s3" {
    bucket = "alex-iac-bucket"
    key    = "dynamodb-example/terraform.tfstate"
    region = "eu-central-1"
  }
}