# Terraform Variable Best Practices

## 1. **Descriptive Variable Names:**
   - **Explanation:** Use descriptive names for variables to enhance readability and understanding of the Terraform configuration.
   - **Example:**
     ```hcl
     variable "instance_type" {
       type        = string
       description = "Type of EC2 instance"
     }
     ```

## 2. **Variable Types:**
   - **Explanation:** Clearly define the type of each variable to enforce proper usage and catch errors during validation.
   - **Example:**
     ```hcl
     variable "subnet_ids" {
       type        = list(string)
       description = "List of subnet IDs"
     }
     ```

## 3. **Default Values:**
   - **Explanation:** Provide default values for variables when applicable to make the configuration more user-friendly.
   - **Example:**
     ```hcl
     variable "instance_type" {
       type    = string
       default = "t2.micro"
     }
     ```

## 4. **Input Validation:**
   - **Explanation:** Implement input validation to ensure variables meet expected criteria, preventing unexpected issues during configuration application.
   - **Example:**
     ```hcl
     variable "subnet_count" {
       type        = number
       description = "Number of subnets"
     
       validation {
         condition     = var.subnet_count > 0
         error_message = "Subnet count must be greater than 0"
       }
     }
     ```

## 5. **Variable Documentation:**
   - **Explanation:** Document each variable thoroughly, providing information on its purpose, expected values, and any constraints.
   - **Example:**
     ```hcl
     # Type of EC2 instance
     variable "instance_type" {
       type        = string
       description = "Type of EC2 instance (e.g., t2.micro)"
     }
     ```

## 6. **Variable Groups:**
   - **Explanation:** Group related variables together for better organization and understanding of their purpose.
   - **Example:**
     ```hcl
     # Network Configuration
     variable "subnet_ids" {
       type        = list(string)
       description = "List of subnet IDs"
     }
     
     variable "vpc_id" {
       type        = string
       description = "ID of the Virtual Private Cloud (VPC)"
     }
     ```

## 7. **Sensitive Variables:**
   - **Explanation:** Mark variables containing sensitive information (e.g., passwords, API keys) as sensitive to ensure they are handled securely.
   - **Example:**
     ```hcl
     variable "database_password" {
       type        = string
       description = "Password for the database"
       sensitive   = true
     }
     ```

## 8. **Input Defaults Over Hardcoding:**
   - **Explanation:** Prefer using default values over hardcoding in your Terraform configuration for flexibility and modularity.
   - **Example:**
     ```hcl
     variable "instance_type" {
       type    = string
       default = "t2.micro"
     }
     ```

## 9. **Dynamic Variables:**
   - **Explanation:** Use dynamic variables when creating configurations that need to adapt to different environments or scenarios.
   - **Example:**
     ```hcl
     variable "environment" {
       type        = string
       description = "Environment (e.g., 'dev', 'prod')"
     }
     
     variable "instance_name" {
       type = string
       # Dynamically set the instance name based on the environment
       default = "web-${var.environment}"
     }
     ```

## 10. **Terraform Input Variables File:**
   - **Explanation:** Utilize a separate variable file to keep sensitive or environment-specific variable values separate from the main configuration.
   - **Example:**
   ```hcl
      # main.tf
      variable "instance_type" {
        type    = string
        default = "t2.micro"
      }

      # terraform.tfvars
      instance_type = "t3.micro"
   ```

## 11. **Immutable Variables:**
   - **Explanation:** Prefer not to modify variable values in-place. Instead, use immutable variables for a more predictable configuration.
   - **Example:**
      ```hcl
      variable "subnet_count" {
        type        = number
        description = "Number of subnets"
      }
      
      # Avoid modifying subnet_count in-place
      locals {
        subnet_count_copy = var.subnet_count
      }
      ```
