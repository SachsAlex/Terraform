output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.my_vpc.id
}

output "subnet_ip1" {
  description = "The public subnet IP of the VPC"
  value       = aws_route_table_association.public_subnet1
}

output "subnet_ip2" {
  description = "The public subnet IP of the VPC"
  value       = aws_route_table_association.public_subnet2
}