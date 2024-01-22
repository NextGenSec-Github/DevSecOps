# Terraform Variables 
## Table of Contents

1. [Introduction](#introduction)
2. [What are Terraform Variables?](#what-are-terraform-variables)
3. [Declaring Variables](#declaring-variables)
    - [Variable Syntax](#variable-syntax)
    - [Variable Types](#variable-types)
    - [Default Values](#default-values)
    - [Description](#description)
4. [Using Variables](#using-variables)
    - [Variable Interpolation](#variable-interpolation)
    - [Input Variable Values](#input-variable-values)
5. [Variable Overrides](#variable-overrides)
6. [Variable Files](#variable-files)
7. [Variable Validation](#variable-validation)
8. [Conclusion](#conclusion)

## Introduction

In Terraform, variables provide a way to parameterize configurations, allowing users to input values dynamically. This flexibility enhances code reuse, promotes modularity, and simplifies the customization of infrastructure configurations.

## What are Terraform Variables?

Terraform variables are placeholders for values in Terraform configurations. They allow users to customize and parameterize their infrastructure code, making it more adaptable to different scenarios.

## Declaring Variables

### Variable Syntax

Declare variables in a Terraform configuration using the `variable` block. Here's an example:

```hcl
variable "region" {
  type        = string
  description = "The AWS region where resources will be created."
}
```

## Variable Types

Variables have types such as string, number, bool, list, map, etc. Specify the type to enforce constraints and ensure correct usage.

```hcl
variable "instance_count" {
  type        = number
  default     = 1
  description = "The number of instances to create."
}
```

## Default Values

Assign default values to variables to provide a fallback when no input is provided.

```hcl
variable "environment" {
  type        = string
  default     = "dev"
  description = "The deployment environment."
}
```

## Description
Include a description for each variable to document its purpose and usage.

```hcl
variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for resource placement."
}
```

## Using Variables

### Variable Interpolation

Interpolate variables into resource configurations using the ${var.variable_name} syntax.

```hcl
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
}
```

### Input Variable Values

```bash
terraform apply -var="region=us-west-2" -var="instance_type=t2.micro"
```

Alternatively, use a variable values file.

```bash
terraform apply -var-file="variables.tfvars"
```

## Variable Overrides

Variables can be overridden using environment variables, making it useful for automation and continuous integration.

```bash
export TF_VAR_region="us-east-1"
terraform apply
```

## Variable Files
Store variable values in separate files to keep sensitive information secure. Create a file (e.g., variables.tfvars) and reference it during the terraform apply command.

```hcl
# variables.tfvars
region        = "us-west-2"
instance_type = "t2.micro"
```

```bash
terraform apply -var-file="variables.tfvars"
```

## Variable Validation
Add validation constraints to variables using validation blocks.

```hcl
variable "subnet_id" {
  type        = string
  description = "ID of the subnet."

  validation {
    condition     = length(var.subnet_id) > 0
    error_message = "Subnet ID must not be empty."
  }
}
```

## Conclusion
Terraform variables play a crucial role in making configurations dynamic and reusable. Understanding how to declare, use, and manage variables provides flexibility and adaptability in managing infrastructure as code.























