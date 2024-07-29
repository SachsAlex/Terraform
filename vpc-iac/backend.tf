terraform {
  backend "s3" {
    bucket = "alex-iac-bucket"
    key    = "vpc-example/terraform.tfstate"
    region = "eu-central-1"
  }
}