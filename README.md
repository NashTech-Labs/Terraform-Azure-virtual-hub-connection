# Terraform-Azure-virtual-hub-connection

This Terraform Git repo contains a module that create virtual-hub-connection in Azure.

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) - v1.0.5 or later
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) - v2.26.0 or later
- Resource group
- Vnet
- Virtual wan
- virtual hub

## Usage

To use this Terraform module, follow these steps:

From your local, generate and Set up SSH key pair for Github.

Clone this Git repo to your local machine.

```bash
git clone git@github.com:NashTech-Labs/Terraform-Azure-virtual-hub-connection.git
```

Change into the directory containing the module.

```bash
cd Terraform-Azure-virtual-hub-connection
```

Create a new file named `vhub-connection.tfvars` in the same directory as your `.tf` files.

```bash
touch vhub-connection.tfvars
```

Open the file in your preferred text editor.

```bash
nano virtual-hub-connection.tfvars
```

Add your desired inputs to the file in the following format:

```ruby
connection_name      = "" 
etc
```
Review the changes that Terraform will make to your Azure resources.


Initialize Terraform 

```bash
terraform init
```
```bash
terraform plan 
```
```bash
terraform apply --auto-approve

```
