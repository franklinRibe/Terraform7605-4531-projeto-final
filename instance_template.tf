resource "google_compute_instance_template" "app-template" {
  name        = var.name_template
  description = var.description_template

  tags = var.template_tags

  machine_type         = var.machine_type
  can_ip_forward       = var.can_ip_forward

  scheduling {
    automatic_restart   = var.automatic_restart
    on_host_maintenance = var.maintenance 
  }

  // Create a new boot disk from an image
  disk {
    source_image = var.os_image
    auto_delete  = var.disk_delete
    boot         = var.disk_boot
  }

  network_interface {
    network    = google_compute_network.vpc.id  
    subnetwork = google_compute_subnetwork.usnet.id

    access_config{
        //EPHEMERAL_IP
    }
  }

  metadata = {
    ssh-keys = var.ssh_pub_key
  }

metadata_startup_script = var.script

}