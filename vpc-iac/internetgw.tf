resource "aws_internet_gateway" "assignment_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}