# Dies ist ein Kommentar

# Provider-Definition (Mindestanforderung für "terraform init")
provider "aws" {
  region = "eu-central-1"
}

# Eine Ubuntu EC2 Instanz im kleinen t2.nano-Format
resource "aws_instance" "instanz_mit_sg" {
  instance_type = "t2.nano"
  ami = "ami-01e444924a2233b07"
  
  # Übergabe der gewünschten Security Group -> unten definiert und benannt (ab Zeile 21-63)
  security_groups = [aws_security_group.TF_SG.name]

  tags = {
    Name = "instanz_mit_sg"
  }
}

#securitygroup using Terraform

resource "aws_security_group" "TF_SG" {
  name        = "security group using Terraform"
  description = "security group using Terraform"
  
  # vpc der bereits erstelleten EC2-Instanz
  vpc_id      = "vpc-0af370656b8d4cc7c"

  #eingehender Verkehr (nur HTTPS, HTTP, SSH)
  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  #ausgehender Verkehr (alle)
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "TF_SG"
  }
}