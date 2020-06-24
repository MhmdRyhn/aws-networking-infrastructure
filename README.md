# aws-networking-infrastructure
This terraform module creates networking infrastructure like VPC, Subnet, Internet Gateway, Nat Gateway, Route Table, Routing Rules, Load Balancer etc.


# Commands To Manipulate Resources
First enter into **terraform** directory to run the following commands.

- Installs required terraform plugins. See more details 
[**here**](https://www.terraform.io/docs/commands/init.html)
```
terraform init
```
- **View execution plan**
```
terraform plan --var-file input_value.tfvars
```

- **Apply the configurations** 
```
terraform apply --var-file input_value.tfvars --auto-approve
```
Remove `--auto-approve` option from the above command to approve manually (by inputting prompt).

If the input file is named exactly `terraform.tfvars` or any variation of `*.auto.tfvars`, those 
will be loaded automatically, you don't need to pass `--var-file` option with the command. In this 
case the command is as following.
```
terraform apply --auto-approve
```
And, the **JSON** version of the input files follows the same above rules.

- **Destroy all resources**
```
terraform destroy --var-file input.tfvars --auto-approve
```
Remove `--auto-approve` option from the above command to approve manually (by inputting prompt).
