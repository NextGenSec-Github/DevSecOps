# Step 5: Enable Security Features

Enabling security features in Docker containers helps enforce mandatory access controls and restrict container processes' capabilities, thereby enhancing the overall security of your containerized applications. In this guide, we'll explore how to enable security features such as SELinux (Security-Enhanced Linux) or AppArmor.

## Why Enable Security Features?

- **Mandatory Access Controls**: Security features like SELinux and AppArmor enforce mandatory access controls, limiting the actions that container processes can perform.
- **Isolation and Containment**: Security features provide an additional layer of isolation and containment, reducing the impact of security breaches and container escapes.
- **Compliance Requirements**: Enabling security features may be necessary to meet compliance requirements with security standards and regulations.

## Enabling SELinux

SELinux is a mandatory access control mechanism available in Linux distributions like CentOS and RHEL. It restricts the actions that processes, including container processes, can perform based on security policies.

### Verify SELinux Status

Check if SELinux is enabled and running on the host system.

```bash
sestatus
```

### Enable SELinux in Docker
Enable SELinux support in Docker by setting the --selinux-enabled flag when starting the Docker daemon.
```bash
sudo dockerd --selinux-enabled
```

### Apply SELinux Labels to Container Files
Apply SELinux labels to container files and directories to ensure proper enforcement of security policies.
```Dockerfile
# Set SELinux context for files and directories
COPY --chown=user:user file.txt /path/to/file.txt
```







