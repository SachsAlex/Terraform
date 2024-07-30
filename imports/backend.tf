terraform {
  backend "s3" {
    bucket = "alex-iac-bucket"
    key    = "ec2-example/ec2-example.tfstate"
    region = "eu-central-1"
  }
}