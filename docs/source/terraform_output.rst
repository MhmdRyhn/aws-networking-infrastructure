
.. _terraform_output:

##########################
Terraform Output Variables
##########################

Terraform output variables are returned from a module. These value can be get from the module and be used those values
as input to another module or the root module.


.. _terraform_output-availability_zones:

``availability_zones``
=======================

A list of availability zones based on your input value for :ref:`max_azs_to_select <terraform_input-max_azs_to_select>`.
The availability zones (azs) are selected in ascending order. For example, if two azs are selected in **us-east-2**
region, the azs are **us-east-2a** and **us-east-2b**.


.. _terraform_output-public_subnets:

``public_subnets``
===================

A list of created public subnets' id.


.. _terraform_output-public_subnet_per_az:

``public_subnet_per_az``
=========================

A map of availability zone to public subnet id. Example:

.. code-block:: json

    {
        "us-east-2a": "public-subnet-1-id",
        "us-east-2b": "public-subnet-2-id",
    }


.. _terraform_output-private_subnets:

``private_subnets``
====================

A list of created private subnets' id.


.. _terraform_output-private_subnet_per_az:

``private_subnet_per_az``
==========================

A map of availability zone to private subnet id. Example:

.. code-block:: json

    {
        "us-east-2a": "private-subnet-1-id",
        "us-east-2b": "private-subnet-2-id",
    }


.. _terraform_output-internet_gateway:

``internet_gateway``
=====================

Internet gateway's id.
