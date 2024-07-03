# Step 1 : Create a VPC for a specific region.

resource "aws_vpc" "tyd-vpc" {
  cidr_block           = "10.16.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "mumbai-region-vpc"
  }
}

# Step 2 : Need to define Subnets
# Note : there will be 2 subnets, Public & Private.

resource "aws_subnet" "tyd-public-subnets" {
  vpc_id     = aws_vpc.tyd-vpc.id
  count      = length(var.vpc_availability_zones)
  cidr_block = cidrsubnet(aws_vpc.tyd-vpc.cidr_block, 8, count.index)
  tags = {
    Name = "tyd-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "tyd-private-subnets" {
  vpc_id     = aws_vpc.tyd-vpc.id
  count      = length(var.vpc_availability_zones)
  cidr_block = cidrsubnet(aws_vpc.tyd-vpc.cidr_block, 8, count.index + 3)
  tags = {
    Name = "tyd-private-subnet-${count.index + 1}"
  }
}

# Step 3 : Creating a internet gateway for VPC

resource "aws_internet_gateway" "tyd-igw" {
  vpc_id = aws_vpc.tyd-vpc.id
  tags = {
    Name = "tyd_internet-gateway"
  }
}

# Step 4 : Create a Route Table for Public Subnet

resource "aws_route_table" "tyd-public-route-table" {
  vpc_id = aws_vpc.tyd-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tyd-igw.id
  }
  tags = {
    Name = "tyd-public-route-table"
  }
}

# Step 5 : Creating Route Table Association for Public Subnet

resource "aws_route_table_association" "tyd-public-route-table-association" {
  route_table_id = aws_route_table.tyd-public-route-table.id
  count          = length(var.vpc_availability_zones)
  subnet_id      = element(aws_subnet.tyd-public-subnets[*].id, count.index)
}

# Step 6 : Creating Elastic IP

resource "aws_eip" "tyd-elastic-ip" {
  depends_on = [aws_internet_gateway.tyd-igw]
  domain     = "vpc"
  tags = {
    Name = "tyd-elastic-ip"
  }
}

# Step 7 Creating A NAT Gateway

resource "aws_nat_gateway" "tyd-nat-gateway" {
  subnet_id     = element(aws_subnet.tyd-private-subnets[*].id, 0)
  allocation_id = aws_eip.tyd-elastic-ip.id
  depends_on    = [aws_internet_gateway.tyd-igw]
  tags = {
    Name = "tyd-nat-gateway"
  }
}

# Step 8 : Route Table for Private Subnet

resource "aws_route_table" "tyd-private-route" {
  vpc_id = aws_vpc.tyd-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tyd-nat-gateway.id
  }
  tags = {
    Name = "tyd-private-route-table"
  }
}

resource "aws_route_table_association" "tyd-private-route-table-association" {
  route_table_id = aws_route_table.tyd-private-route.id
  count          = length(var.vpc_availability_zones)
  subnet_id      = element(aws_subnet.tyd-private-subnets[*].id, count.index)
}