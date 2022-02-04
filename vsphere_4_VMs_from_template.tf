terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.0.2"
    }
  }
}

provider "vsphere" {
  user           = "enter your username"
  password       = "enter your password"
  vsphere_server = "enter your server ip"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "enter your datacenter name"
}

data "vsphere_datastore" "datastore" {
  name          = "enter your datastore name"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "enter your cluster name"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "enter your network name"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "enter your template name"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
resource "vsphere_virtual_machine" "vm" {
  name             = "apache_nifi_1"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 1
  memory   = 4096
  guest_id = "rhel8_64Guest"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = 25
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "apache_nifi_1"
        domain    = "enter your domain"
      }
    }
  }

}
resource "vsphere_virtual_machine" "vm2" {
  name             = "apache_nifi_2"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 1
  memory   = 4096
  guest_id = "rhel8_64Guest"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = 25
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "apache_nifi_2"
        domain    = "enter your domain"
      }
    }
  }

}
resource "vsphere_virtual_machine" "vm3" {
  name             = "apache_nifi_3"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 1
  memory   = 4096
  guest_id = "rhel8_64Guest"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = 25
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "apache_nifi_3"
        domain    = "enter your domain"
      }
    }
  }

}
resource "vsphere_virtual_machine" "vm4" {
  name             = "apache_nifi_4"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 1
  memory   = 4096
  guest_id = "rhel8_64Guest"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = 25
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "apache_nifi_4"
        domain    = "enter your domain"
      }
    }
  }

}
