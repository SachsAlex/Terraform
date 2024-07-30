# Importiere die VPC-ID und die öffentlichen Subnet-IDs aus dem VPC-Deployment
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "alex-iac-bucket"
    key    = "ec2-example/vpc.tfstate"
    region = "eu-central-1"
  }
}