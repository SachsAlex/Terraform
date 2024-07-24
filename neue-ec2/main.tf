# Dies ist ein Kommentar

# Provider-Definition (Mindestanforderung für "terraform init")
provider "aws" {
  region = "eu-central-1"
}

# Eine Ubuntu EC2 Instanz im kleinen t2.nano-Format
resource "aws_instance" "assignement_2407" {
  instance_type = "t2.nano"
  ami = "ami-0e872aee57663ae2d"
  vpc_security_group_ids = [ "sg-07f38cf66b3e51335", "sg-0c4c7ec4fc0ea2551" ]
  # ["<vpc-sg>", "<ssh-sg>"]
}