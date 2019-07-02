locals {
  common_tags = [var.environment_name]
  all_tags    = concat(local.common_tags, var.tags == null ? [] : var.tags)
}

resource "digitalocean_firewall" "main" {
  name = var.firewall_name
  tags = local.all_tags

  droplet_ids = var.droplet_ids

  dynamic "inbound_rule" {
    for_each = var.inbound_rules
    iterator = r
    content {
      protocol                  = r.value.protocol
      port_range                = r.value.port_range
      source_addresses          = r.value.source_addresses
      source_droplet_ids        = r.value.source_droplet_ids
      source_tags               = r.value.source_tags
      source_load_balancer_uids = r.value.source_load_balancer_uids
    }
  }

  dynamic "outbound_rule" {
    for_each = var.outbound_rules
    iterator = r
    content {
      protocol                       = r.value.protocol
      port_range                     = r.value.port_range
      destination_addresses          = r.value.destination_addresses
      destination_droplet_ids        = r.value.destination_droplet_ids
      destination_tags               = r.value.destination_tags
      destination_load_balancer_uids = r.value.destination_load_balancer_uids

    }
  }
}
