resource "google_compute_instance" "example" {
  name         = "example-vm"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external IP address
    }
  }

  metadata = {
    foo = "bar"
  }

  service_account {
    email  = jenkins@devops-392615.iam.gserviceaccount.com
    scopes = ["cloud-platform"]
  }
}
