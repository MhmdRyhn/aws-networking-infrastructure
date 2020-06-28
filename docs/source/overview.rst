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
2. One or more **public subnet**.
3. One or more **private subnet**.
4. An Internet Gateway for the VPC.
5. A route table for public subnets.
6. One or more **elastic IPs**.
7. One or more NAT Gateways and attach Elastic IPs to the NAT instances.
8. One or more route table for private subnets.


=============
Restrictions
=============

This module has some restrictions as follows:

1. The VPC CIDR is always **10.0.0.0/16** and this is fixed for this module.
2. The subnet CIDR is always in the format **10.0.x.0/24** and this is fixed for this module.


============
Limitations
============

This module has some limitations as follows:

1. This module can't create more than 254 subnets (private and public) in total.
