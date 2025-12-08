output "vpc_id" {
  description = "ID of the VPC"
  value       = abrha_vpc.main.id
}

output "vm_ids" {
  description = "IDs of the created VMs"
  value       = abrha_vm.redis[*].id
}

output "vm_names" {
  description = "Names of the created VMs"
  value       = abrha_vm.redis[*].name
}

output "vm_ips" {
  description = "IP addresses of the created VMs"
  value       = abrha_vm.redis[*].ipv4_address
}
