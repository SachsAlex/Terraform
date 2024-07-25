# Provider-Definition (Mindestanforderung für "terraform init")
provider "aws" {
  region = "eu-central-1"
}

# Security Group erstellen, die SSH über IPv4 (überall) erlaubt
resource "aws_security_group" "allow_assignment1" {
  # keine verpflichtende Argumente bei Security-Groups
  tags = {
    Name = "Assignment 25.07.2024"
  }
}

resource "aws_security_group_rule" "ingress_ssh" {
  from_port = 22
  to_port = 22
  security_group_id = aws_security_group.allow_assignment1.id
  protocol = "tcp"
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress_http" {
  from_port = 80
  to_port = 80
  security_group_id = aws_security_group.allow_assignment1.id
  protocol = "tcp"
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress_https" {
  from_port = 443
  to_port = 443
  security_group_id = aws_security_group.allow_assignment1.id
  protocol = "tcp"
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

# Code von https://stackoverflow.com/questions/55023605/aws-and-terraform-default-egress-rule-in-security-group
resource "aws_security_group_rule" "egress_all" {
  from_port = 0
  to_port = 0
  security_group_id = aws_security_group.allow_assignment1.id
  protocol = "-1"
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}

# Eine Linux EC2 Instanz
resource "aws_instance" "assignment_2507" {
  instance_type = "t2.micro"
  ami = "ami-071878317c449ae48"
  tags = {
    Name = "Schokokeks"
  }
  vpc_security_group_ids = [ aws_security_group.allow_assignment1.id ]
}

output "public_ip_addr" {
  value = aws_instance.assignment_2507.public_ip
}

output "sg_name" {
  value = aws_security_group.allow_assignment1.name
}

output "sg_rule_1" {
  value = aws_security_group_rule.ingress_ssh
}

output "sg_rule_2" {
  value = aws_security_group_rule.ingress_http
}

output "sg_rule_3" {
  value = aws_security_group_rule.ingress_https
}

output "sg_rule_egress" {
  value = aws_security_group_rule.egress_all
}