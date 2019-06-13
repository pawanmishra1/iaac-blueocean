variable "vsphere_user" {
  description = "vsphere user name"
  default     = "administrator@emcdigital.lab"
}

variable "vsphere_password" {
  description = "vsphere password"
}

variable "vsphere_server" {
  description = "vsphere server"
  default     = "192.168.0.10"
}

variable "vsphere_datacenter" {
  description = "vsphere datacenter name"
  default     = "Datacenter"
}

variable "vsphere_compute_cluster" {
  description = "vsphere compute cluster name"
  default     = "Cluster_iaac"
}

variable "vsphere_host" {
  description = "vsphere host name"
  default     = "192.168.0.12"
}

variable "vsphere_datastore" {
  description = "vsphere datastore name"
  default     = "Datastore_VM"
}

variable "vsphere_network" {
  description = "vsphere network name"
  default     = "vmnet"
}

variable "vsphere_network_interface"{
  description = "vsphere network interface"
  default     = "{}"
}


variable "vsphere_virtual_machine_template" {
  description = "vsphere virtual machine template name"
  default     = "centos-7"
}

variable "vsphere_virtual_machine_names" {
  type        = "map"
  description = "vsphere virtual machine name"

  default = {
    "loadbalancer" = "loadbalancer"
    "webserver01"  = "webserver01"
    "webserver02"  = "webserver02"
    "webserver03"  = "webserver03"
    "dbserver"     = "dbserver"
    "kubernetes"   = "kubernetes"
  }
}



variable "vsphere_virtual_machine_folder" {
  description = "vsphere virtual machine folder name"
  default     = "appmod_vms"
}

variable "vsphere_virtual_machine_domain" {
  description = "vsphere virtual machine domain"
  default     = "emcdigital.lab"
}

variable "vsphere_virtual_machine_ipv4_addresses" {
  description = "vsphere virtual machine ipv4 addresses"
  type        = "map"

  default = {
    "loadbalancer" = "192.168.0.18"
    "webserver01"  = "192.168.0.19"
    "webserver02"  = "192.168.0.20"
    "webserver03"  = "192.168.0.21"
    "dbserver"     = "192.168.0.22"
    "kubernetes"   = "192.168.0.23"
  }
}

variable "vsphere_virtual_machine_num_cpus" {
  description = "vsphere virtual machine cpu number"
  type        = "map"

  default = {
    "loadbalancer" = "1"
    "webserver01"  = "1"
    "webserver02"  = "1"
    "webserver03"  = "1"
    "dbserver"     = "1"
    "kubernetes"   = "4"
  }
}


variable "vsphere_virtual_machine_ipv4_netmask" {
  description = "vsphere virtual machine ipv4 netmask"
  default     = 24
}

variable "vsphere_virtual_machine_dns_server_list" {
  description = "vsphere virtual machine dns server list"
  type        = "list"
  default     = ["8.8.8.8"]
}

variable "vsphere_virtual_machine_dns_suffix_list" {
  description = "vsphere virtual machine dns suffix list"
  type        = "list"
  default     = ["emcdigital.lab"]
}

variable "vsphere_virtual_machine_ipv4_gateway" {
  description = "vsphere virtual machine ipv4 gateway"
  default     = "192.168.0.1"
}

variable "vsphere_virtual_machine_wait_for_guest_net_timeout" {
  description = "vsphere virtual machine guest network time out value in minutes"
  default     = -1
}

variable "vsphere_virtual_machine_wait_for_guest_net_routable" {
  description = "vsphere virtual machine guest network routable wait flag"
  default     = false
}
