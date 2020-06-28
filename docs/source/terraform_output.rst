
.. _terraform_output:

##########################
Terraform Output Variables
##########################

Terraform output variables are returned from a module. These value can be get from the module and be used those values
as input to another module or the root module.


.. _terraform_output-vpc_id:

``vpc_id``
===========

The created VPC's id.


.. _terraform_output-public_subnets_id:

``public_subnets_id``
======================

A list of created public subnets' id.


.. _terraform_output-private_subnets:

``private_subnets_id``
=======================

A list of created private subnets' id.


.. _terraform_output-internet_gateway:

``internet_gateway_id``
========================

Internet gateway's id.
