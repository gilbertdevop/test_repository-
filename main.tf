

##########################################

resource "aws_vpc" "utc_app1" {
  cidr_block           = "172.120.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "utc-app1"
    env         = "dev"
    team        = "wdp"
    created_by  = "Gilbertken"
  }
}

resource "aws_internet_gateway" "dev_wdp_igw" {
  vpc_id = aws_vpc.utc_app1.id

  tags = {
    Name = "dev-wdp-IGW"
  }
}

resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = aws_vpc.utc_app1.id
  cidr_block        = "172.120.4.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1a"
  }
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id            = aws_vpc.utc_app1.id
  cidr_block        = "172.120.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1b"
  }
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.utc_app1.id
  cidr_block        = "172.120.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet-1a"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id            = aws_vpc.utc_app1.id
  cidr_block        = "172.120.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet-1b"
  }
}

resource "aws_route" "route_to_internet_gateway" {
  route_table_id         = aws_vpc.utc_app1.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev_wdp_igw.id
}

