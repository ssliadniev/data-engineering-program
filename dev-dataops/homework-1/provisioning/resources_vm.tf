resource "google_compute_instance" "gsp_vm" {
  project      = var.project_id
  machine_type = var.machine_type
  zone         = var.zone

  name = local.vm_name

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }

  network_interface {
    network = "default"
  }

  allow_stopping_for_update = true

  lifecycle {
    ignore_changes = [
      machine_type,
    ]
  }
}
