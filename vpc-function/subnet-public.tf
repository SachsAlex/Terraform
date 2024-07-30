# Erstelle öffentliche Subnetze
resource "aws_subnet" "public" {
  count = length(local.azs) # 3 ,Index:  Je nach Iteration: 0, 1, 2 

  vpc_id                  = aws_vpc.main.id
  cidr_block              = local.public_subnets[count.index]
  availability_zone       = local.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = local.public_subnet_names[count.index]
  }
}
