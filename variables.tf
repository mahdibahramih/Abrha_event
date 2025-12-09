variable "abrha_api_key" {
  description = "API key for Abrha provider"
  type        = string
  sensitive   = true
}

variable "abrha_endpoint" {
  description = "Abrha API endpoint"
  type        = string
  default     = "https://my.abrha.net/cserver/api"
}

variable "ssh_public_key" {
  description = "SSH public key for VM authentication"
  type        = string
}

variable "region" {
  description = "Region for resources"
  type        = string
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
}

variable "vm_size" {
  description = "Size of the VMs"
  type        = string
}

variable "image_slug" {
  description = "Image slug for VMs"
  type        = string
}

variable "ssh_key_name" {
  description = "Name for the SSH key resource"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_ip_range" {
  description = "IP range for the VPC"
  type        = string
}
