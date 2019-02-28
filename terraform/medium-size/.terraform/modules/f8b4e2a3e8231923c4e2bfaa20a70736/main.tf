provider "vsphere" {
  user                 = "${var.vsphere_user}"
  password             = "${var.vsphere_password}"
  vsphere_server       = "${var.vsphere_server}"
  allow_unverified_ssl = "${var.vsphere_unverified_ssl}"
}

data "vsphere_datacenter" "datacenter" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "${var.vsphere_compute_cluster}"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

data "vsphere_host" "host" {
  name          = "${var.vsphere_host}"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_network}"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vsphere_virtual_machine_template}"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vsphere_virtual_machine_name}"
  host_system_id   = "${data.vsphere_host.host.id}"
  resource_pool_id = "${data.vsphere_host.host.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  folder           = "${var.vsphere_virtual_machine_folder}"

  num_cpus  = "${var.vsphere_virtual_machine_num_cpus}"
  memory    = "${var.vsphere_virtual_machine_memory}"
  guest_id  = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.vsphere_virtual_machine_host_name}"
        domain    = "${var.vsphere_virtual_machine_domain}"
      }

      network_interface {
        ipv4_address = "${var.vsphere_virtual_machine_ipv4_address}"
        ipv4_netmask = "${var.vsphere_virtual_machine_ipv4_netmask}"
      }

      ipv4_gateway    = "${var.vsphere_virtual_machine_ipv4_gateway}"
      dns_server_list = "${var.vsphere_virtual_machine_dns_server_list}"
      dns_suffix_list = "${var.vsphere_virtual_machine_dns_suffix_list}"
    }
  }

  #wait_for_guest_net_timeout  = "${var.vsphere_virtual_machine_wait_for_guest_net_timeout}"
  #wait_for_guest_net_routable = "${var.vsphere_virtual_machine_wait_for_guest_net_routable}"
}
