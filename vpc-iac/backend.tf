terraform {
  backend "s3" {
    bucket = "bucket-aws23-10"
    key    = "vpc-example/terraform.tfstate"
    region = "eu-central-1"
  }
}