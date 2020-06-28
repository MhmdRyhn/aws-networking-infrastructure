output "vpc_id" {
  value = aws_vpc.main_vpc[0].id
}

output "public_subnets_id" {
  value = [for subnet in aws_subnet.public_subnet : subnet.id]
}

output "private_subnets_id" {
  value = [for subnet in aws_subnet.private_subnet : subnet.id]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway[0].id
}

