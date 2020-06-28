
.. _terraform_input:

#########################
Terraform Input Variables
#########################

A :ref:`Terraform Module <structure-terraform>` is included which should be used to create infrastructure for
application to be deployed. The Terraform module accepts variable inputs to configure the resources.


.. _terraform_input-region:

``region``
===========

Name of the AWS region where the infrastructure will be created.


.. _terraform_input-access_key:

``access_key``
===============

IAM or root user access key. It is a must to ensure that the IAM user has access to create all the resources
used in this module.


.. _terraform_input-secret_access_key:

``secret_access_key``
======================

IAM or root user secret access key. It is a must to ensure that the IAM user has access to create all the resources
used in this module.

**Note:** :ref:`secret_access_key <terraform_input-secret_access_key>` and
:ref:`access_key <terraform_input-access_key>` are necessary only when this module is used as the root module
(i.e., as standalone module). In this case comment out the **provide** block in **terraform/provider.tf** file.


.. _terraform_input-environment:

``environment``
================

Deployment environment name. It can be one of **dev, test, stable, staging, uat or prod**. Default value is **dev**.


.. _terraform_input-identifier:

``identifier``
===============

This is a string that helps you easily differentiate your resources from others. This will be used as the first part of
your resource name. For example. If your resource name is **nat-gateway**, environment is dev, region is us-east-2
and the identifier is **DemoCloud**, then your resource name will be **DemoCloud-dev-US-EAST-2-nat-gateway**.


.. _terraform_input-number_of_private_subnet:

``number_of_private_subnet``
=============================

The number of private subnet you want to create. This must ne a positive integer. Subnets will be distributed across
the availability zones (azs) evenly. For example, in us-east-2, there are 3 azs named us-east-2a, us-east-2b,
us-east-2c and you choose to create 5 private subnets. In this case, there will be 2, 2 and 1 subnets in us-east-2a,
us-east-2b and us-east-2c respectively.


.. _terraform_input-number_of_public_subnet:

``number_of_public_subnet``
============================

The number of public subnet you want to create. This must ne a positive integer. Subnets will be distributed across
the availability zones (azs) evenly the way private subnets are done. For example, in us-east-2, there are 3 azs named
us-east-2a, us-east-2b, us-east-2c and you choose to create 5 private subnets. In this case, there will be 2, 2 and 1
subnets in us-east-2a, us-east-2b and us-east-2c respectively.


.. _terraform_input-nat_gateways_to_be_used:

``nat_gateways_to_be_used``
============================

Value can either be `single` or `per-subnet`. If the value set is other than `per-subnet`, it'll consider that value as
`single`. Default value is `single`.

If value is `single`, a common NAT Gateway will be used for all the **private subnets**. If the value is `per-subnet`,
then one NAT Gateway per private subnet will be created. This option (per-subnet) is essential for high availability
and high performance.
