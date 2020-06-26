.. _overview:

########
Overview
########


========
Features
========

The purpose of this module is to create **Networking Infrastructure in AWS** for applications to be deployed.
This module creates the following resources:

1. A VPC.
2. Two or more **public subnet**.
3. Two or more **private subnet**.
4. An Internet Gateway for the VPC.
5. A route table for public subnets.
6. One or more **elastic IPs**.
7. One or more NAT Gateways and attach elastic IPs to the NAT instances.
8. One or more route table for private subnets.


============
Limitations
============

This module has some limitations as follows:

1. This module can't create subnets (private or public) more than the number of availability zones of the specified region.
2. This module creates at least 2 private and 2 public subnets (total 4 subnets).


=============
Restrictions
=============

This module has some restrictions as follows:

1. It creates equal number of private and public subnets per availability zone.
2. The VPC CIDR is always **10.0.0.0/16** and this is fixed for this module.
3. The subnet CIDR is always in the format **10.0.x.0/24** and this is fixed for this module.
