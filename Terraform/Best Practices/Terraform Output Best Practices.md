# Terraform Output Best Practices

## 1. Document Outputs:

Provide comprehensive documentation for each output to guide users on its purpose and usage. Include examples and any relevant considerations.

*Example:*

```hcl
output "public_ip" {
  description = "The public IP address of the deployed instance"
  value       = aws_instance.example.public_ip
}
```

## Use Descriptive Names:

Choose names that clearly convey the purpose of the output. This improves readability and understanding, reducing the need for extensive documentation.

*Example:* 

```hcl
output "database_address" {
  value = aws_db_instance.example.address
}
```

