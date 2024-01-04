moved {
  from = aws_vpc.aft_vpc
  to   = module.aft-vpc.aws_vpc.default[0]
}

moved {
  from = aws_eip.aft-vpc-natgw-01
  to   = module.aft-vpc-subnets.aws_eip.default[0]
}

moved {
  from = aws_eip.aft-vpc-natgw-02
  to   = module.aft-vpc-subnets.aws_eip.default[1]
}

moved {
  from = aws_internet_gateway.aft-vpc-igw
  to   = module.aft-vpc.aws_internet_gateway.default[0]
}

moved {
  from = aws_nat_gateway.aft-vpc-natgw-01
  to   = module.aft-vpc-subnets.aws_nat_gateway.default[0]
}

moved {
  from = aws_nat_gateway.aft-vpc-natgw-02
  to   = module.aft-vpc-subnets.aws_nat_gateway.default[1]
}

moved {
  from = aws_route_table.aft_vpc_private_subnet_01
  to   = module.aft-vpc-subnets.aws_route_table.private[0]
}

moved {
  from = aws_route_table.aft_vpc_private_subnet_02
  to   = module.aft-vpc-subnets.aws_route_table.private[1]
}

moved {
  from = aws_route_table.aft_vpc_public_subnet_01
  to   = module.aft-vpc-subnets.aws_route_table.public[0]
}

moved {
  from = aws_route_table_association.aft_vpc_private_subnet_01
  to   = module.aft-vpc-subnets.aws_route_table_association.private[0]
}

moved {
  from = aws_route_table_association.aft_vpc_private_subnet_02
  to   = module.aft-vpc-subnets.aws_route_table_association.private[1]
}

moved {
  from = aws_route_table_association.aft_vpc_public_subnet_01
  to   = module.aft-vpc-subnets.aws_route_table_association.public[0]
}

moved {
  from = aws_route_table_association.aft_vpc_public_subnet_02
  to   = module.aft-vpc-subnets.aws_route_table_association.public[1]
}

moved {
  from = aws_security_group.aft_vpc_default_sg
  to   = module.aft-default-sg.aws_security_group.default[0]
}

moved {
  from = aws_subnet.aft_vpc_private_subnet_01
  to   = module.aft-vpc-subnets.aws_subnet.private[0]
}

moved {
  from = aws_subnet.aft_vpc_private_subnet_02
  to   = module.aft-vpc-subnets.aws_subnet.private[1]
}


moved {
  from = aws_subnet.aft_vpc_public_subnet_01
  to   = module.aft-vpc-subnets.aws_subnet.public[0]
}

moved {
  from = aws_subnet.aft_vpc_public_subnet_02
  to   = module.aft-vpc-subnets.aws_subnet.public[1]
}
