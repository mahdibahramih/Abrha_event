
data "abrha_region" "region" {
  slug = var.region
}

resource "abrha_ssh_key" "main" {   
  name       = var.ssh_key_name
  public_key = var.ssh_public_key
}
resource "abrha_vpc" "main" {
  name        = var.vpc_name
  region      = data.abrha_region.region.slug
  ip_range    = var.vpc_ip_range
}

resource "abrha_vm" "redis" {
  count    = var.vm_count
  name     = "redis-${count.index + 1}"
  region   = data.abrha_region.region.slug
  size     = var.vm_size
  image    = var.image_slug

  
  vpc_uuid = abrha_vpc.main.id
  ssh_keys = [abrha_ssh_key.main.id]
}

resource "time_sleep" "wait_10s" {
  depends_on = [abrha_vm.redis]
  
  create_duration = "10s"
}
