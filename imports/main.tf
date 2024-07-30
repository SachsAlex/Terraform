# Erstelle eine EC2-Instance
resource "aws_instance" "web" {
  ami                    = "ami-01e444924a2233b07" # Ubuntu Server 20.04 LTS für eu-central-1
  instance_type          = "t2.micro"
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnet_id_1a # Nutzt ein öffentliches Subnetz
  vpc_security_group_ids = [aws_security_group.http.id]                                # Nutzt VPC-Security-Gruppen
  key_name               = "alex-new-key"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              echo "<html><body><h1>Hello, World</h1></body></html>" > /var/www/html/index.html
              systemctl enable apache2
              systemctl start apache2
              EOF

  tags = {
    Name = "web-server"
  }
}

