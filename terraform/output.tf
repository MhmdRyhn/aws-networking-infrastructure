output "availability_zones" {
  value = local.azs
}

output "public_subnets" {
  value = [for subnet in aws_subnet.public_subnet: subnet.id]
}

output "public_subnet_per_az" {
  value = zipmap(local.azs, [for subnet in aws_subnet.public_subnet: subnet.id])
}

output "private_subnets" {
  value = [for subnet in aws_subnet.private_subnet: subnet.id]
}

output "private_subnet_per_az" {
  value = zipmap(local.azs, [for subnet in aws_subnet.private_subnet: subnet.id])
}

output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway.id
}

//output "route_table_public" {
//  value = aws_route_table.public_route_table.id
//}
//
//output "route_table_private" {
//  value = merge(
//    {
//      all = [for rt in aws_subnet.public_subnet: subnet.id]
//    }, zipmap(local.azs, [for subnet in aws_subnet.public_subnet: subnet.id])
//  )
//}
