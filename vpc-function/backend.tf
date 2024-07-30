terraform {
  backend "s3" {
    bucket = "alex-iac-bucket"
    key    = "ec2-example/vpc.tfstate"
    region = "eu-central-1"
  }
}