variable "environment_name" {
  type = string
}

variable "region" {
  type    = string
  default = "fra1"
}

variable "firewall_name" {
  type = string
}

variable "inbound_rules" {
  type = list
  default = [{
    protocol                  = "tcp"
    port_range                = "22"
    source_addresses          = ["0.0.0.0/0", "::/0"]
    source_droplet_ids        = []
    source_tags               = []
    source_load_balancer_uids = []
  }]
}

variable "outbound_rules" {
  type = list
  default = [{
    protocol                       = "tcp"
    port_range                     = "1-65535"
    destination_addresses          = ["0.0.0.0/0", "::/0"]
    destination_droplet_ids        = []
    destination_tags               = []
    destination_load_balancer_uids = []
    }, {
    protocol                       = "udp"
    port_range                     = "1-65535"
    destination_addresses          = ["0.0.0.0/0", "::/0"]
    destination_droplet_ids        = []
    destination_tags               = []
    destination_load_balancer_uids = []
    }, {
    protocol                       = "icmp"
    port_range                     = "1-65535"
    destination_addresses          = ["0.0.0.0/0", "::/0"]
    destination_droplet_ids        = []
    destination_tags               = []
    destination_load_balancer_uids = []
  }]
}

variable "tags" {
  type    = list(string)
  default = null
}

variable "droplet_ids" {
  type    = list(string)
  default = null
}
