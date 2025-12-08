# Abrha Event - Terraform Configuration

This Terraform configuration creates multiple virtual machines within a private VPC using the Abrha cloud provider.

## Overview

This configuration deploys:
- **VPC**: A private virtual network with custom IP range
- **SSH Key**: Managed SSH key for VM access
- **Virtual Machines**: Multiple VMs (default: 1) running Ubuntu 22.04

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) >= 1.0
- Abrha account with API credentials
- SSH public key for VM authentication

## Project Structure

```
.
├── provider.tf              # Provider configuration
├── main.tf                  # Main resources (VPC, VMs, SSH keys)
├── variables.tf             # Variable definitions
├── outputs.tf               # Output definitions
├── terraform.tfvars         # Variable values (not committed)
└── terraform.tfvars.example # Example configuration
```

## Quick Start

### 1. Clone and Setup

```bash
git clone <repository-url>
cd Abrha_event
```

### 2. Configure Variables

Copy the example configuration and edit with your values:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars`:

```hcl
abrha_api_key   = "your-api-key-here"
ssh_public_key  = "ssh-rsa AAAAB3... your-email@example.com"
region          = "tehran3"
vm_count        = 6
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Plan and Apply

Review the planned changes:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

### 5. Access Outputs

View created resources:

```bash
terraform output
```

## Configuration Variables

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `abrha_api_key` | Abrha API authentication key | - | Yes |
| `abrha_endpoint` | Abrha API endpoint URL | `https://my.abrha.net/cserver/api` | No |
| `ssh_public_key` | SSH public key for VM access | - | Yes |
| `region` | Abrha region slug | `tehran3` | No |
| `vm_count` | Number of VMs to create | `1` | No |
| `vm_size` | VM size/plan | `irVPS2` | No |
| `image_slug` | OS image slug | `Ubuntu22-x64` | No |
| `ssh_key_name` | Name for SSH key resource | `main-ssh-key` | No |
| `vpc_name` | Name of the VPC | `mainVpc` | No |
| `vpc_ip_range` | VPC IP address range | `192.168.20.0` | No |
| `vpc_description` | VPC description | `Private network for Abrha Event` | No |

## Outputs

After successful deployment, the following outputs are available:

- `vpc_id` - ID of the created VPC
- `vm_ids` - List of all VM IDs
- `vm_names` - List of all VM names
- `vm_ips` - List of VM IP addresses

## Customization

### Change Number of VMs

Edit `terraform.tfvars`:

```hcl
vm_count = 6
```

### Use Different Region

Available regions: `tehran3`, etc.

```hcl
region = "tehran3"
```

### Change VM Size

```hcl
vm_size = "irVPS4"  # Check Abrha docs for available sizes
```

## Managing Infrastructure

### View Current State

```bash
terraform show
```

### Update Infrastructure

After modifying variables or configuration:

```bash
terraform plan
terraform apply
```

### Destroy Infrastructure

To remove all created resources:

```bash
terraform destroy
```

## Security Best Practices

1. **Never commit `terraform.tfvars`** - Contains sensitive credentials
2. **Use SSH keys** - Password authentication is disabled
3. **Restrict API keys** - Use minimal required permissions
4. **Review plans** - Always run `terraform plan` before applying

## Troubleshooting

### Authentication Issues

Verify your API key:
```bash
export ABRHA_API_KEY="your-key"
```

### SSH Connection

Connect to VMs using:
```bash
ssh -i ~/.ssh/your-key ubuntu@<vm-ip>
```

### State Locking

If state is locked:
```bash
terraform force-unlock <lock-id>
```

## Resources

- [Abrha Provider Documentation](https://registry.terraform.io/providers/abrhacom/abrha/latest/docs)
- [Terraform Documentation](https://www.terraform.io/docs)
- [Abrha Cloud Portal](https://my.abrha.net)

