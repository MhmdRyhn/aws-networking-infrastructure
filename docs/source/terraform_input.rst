
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


.. _terraform_input-max_azs_to_select:

``max_azs_to_select``
======================

Maximum number of availability zones to select. If the value is less than 2 it's value'll be 2 (i.e., minimum 2 azs).
If the value is greater than the number of availability zones of the region selected, then it's value'll be the
maximum number of availability zones in that region.

If the calculated number of availability zones is say `x`, then there will be `x` public subnets and `x`
private subnets created.


.. _terraform_input-nat_gateways_to_be_used:

``nat_gateways_to_be_used``
============================

Value can either be `single` or `multiple`. If the value set is other than `multiple`, it'll consider that value as
`single`. Default value is `single`.

If value is `single`, a common NAT Gateway will be used for all the **private subnets**. If the value is `multiple`,
then one NAT Gateway per private subnet will be created. This option is essential for high availability and high
performance.
