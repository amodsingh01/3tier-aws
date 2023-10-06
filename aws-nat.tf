resource "aws_nat_gateway" "natgw" {
  allocation_id     = aws_eip.publicip.id
  subnet_id         = aws_subnet.public-subnet-1.id
  connectivity_type = "public"
  tags = {
    Name = "natgw"
  }
}