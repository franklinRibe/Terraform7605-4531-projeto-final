resource "google_compute_network" "vpc" {

    name = var.vpc_name
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "usnet" {

    name = var.subname
    ip_cidr_range = var.iprange
    region = var.region
    network = google_compute_network.vpc.id
}

resource "google_compute_firewall" "fw-web" {

    name = var.fw-name
    network = google_compute_network.vpc.id
    allow{
        protocol = "icmp"
    }

    allow {
      protocol = var.protocol
      ports = var.ports

    }

    source_ranges = var.sources
    source_tags = var.tags

}