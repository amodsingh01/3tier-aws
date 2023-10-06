resource "aws_route_table" "route-table1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "my-routes"
  }
}


resource "aws_route_table_association" "sub_ass" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.route-table1.id
}