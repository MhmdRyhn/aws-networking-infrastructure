
.. _configuration:

#############
Configuration
#############

A :ref:`Terraform Module <structure-terraform>` is included which should be used to create infrastructure for
application to be deployed. The Terraform module accepts variable inputs to configure the resources.


.. _terraform-input:

=========================
Terraform Input Variables
=========================


.. _terraform-input-region:

``region``
===========

Name of the AWS region where the infrastructure will be created.


.. _terraform-input-access_key:

``access_key``
===============

IAM or root user access key. It is a must to ensure that the IAM user has access to create all the resources
used in this module.


.. _terraform-input-secret_access_key:

``secret_access_key``
======================

IAM or root user secret access key. It is a must to ensure that the IAM user has access to create all the resources
used in this module.


.. _terraform-input-environment:

``environment``
================

Deployment environment name. It can be one of **dev, test, stable, staging, uat or prod**. Default value is **dev**.


.. _terraform-input-max_azs_to_select:

``max_azs_to_select``
======================

Maximum number of availability zones to select. If the value is less than 2 it's value'll be 2 (i.e., minimum 2 azs).
If the value is greater than the number of availability zones of the region selected, then it's value'll be the
maximum number of availability zones in that region.

If the calculated number of availability zones is say `x`, then there will be `x` public subnets and `x`
private subnets created.


.. _terraform-input-nat_gateways_to_be_used:

``nat_gateways_to_be_used``
============================

Value can either be `single` or `multiple`. If the value set is other than `multiple`, it'll consider that value as
`single`. Default value is `single`.

If value is `single`, a common NAT Gateway will be used for all the **private subnets**. If the value is `multiple`,
then one NAT Gateway per private subnet will be created. This option is essential for high availability and high
performance.
