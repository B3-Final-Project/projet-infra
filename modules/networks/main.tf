# 1) Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${aws_vpc.main.tags["Name"]}-igw"
  }
}

# 2) Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${aws_vpc.main.tags["Name"]}-public-rt"
  }
}

# 3) Associate the public RT with each public subnet
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# 4) NAT Gateway for private subnets
resource "aws_eip" "nat" {
  count  = 1
  domain = "vpc"
  
  depends_on = [aws_internet_gateway.igw]
  
  tags = {
    Name = "nat-gateway-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  count         = 1
  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id
  
  depends_on = [aws_internet_gateway.igw]
  
  tags = {
    Name = "nat-gateway"
  }
}

# 5) Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat[0].id
  }

  tags = {
    Name = "${aws_vpc.main.tags["Name"]}-private-rt"
  }
}

# 6) Associate the private RT with each private subnet
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
