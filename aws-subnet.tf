resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "192.168.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-1"
  }
}
resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "192.168.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-2"
  }
}
resource "aws_subnet" "private-subnet-1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "192.168.3.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = false


  tags = {
    Name = "private-subnet-1"
  }
}
resource "aws_subnet" "private-subnet-2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "192.168.4.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = false


  tags = {
    Name = "private-subnet-2"
  }
}
