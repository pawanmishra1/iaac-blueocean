variable "vsphere_user" {
  description = "vsphere user name"
}

variable "vsphere_password" {
  description = "vsphere password"
}

variable "vsphere_server" {
  description = "vsphere server"
}

variable "vsphere_unverified_ssl" {
  description = "unverified ssl (true/false)?"
  default     = true
}

variable "vsphere_datacenter" {
  description = "vsphere datacenter name"
}

variable "vsphere_compute_cluster" {
  description = "vsphere compute cluster name"
}

variable "vsphere_host" {
  description = "vsphere host name"
}

variable "vsphere_datastore" {
  description = "vsphere datastore name"
}

variable "vsphere_network" {
  description = "vsphere network name"
}

variable "vsphere_virtual_machine_template" {
  description = "vsphere virtual machine template name"
}

variable "vsphere_virtual_machine_name" {
  description = "vsphere virtual machine name"
}

variable "vsphere_virtual_machine_folder" {
  description = "vsphere virtual machine folder name"
}

variable "vsphere_virtual_machine_num_cpus" {
  description = "vsphere virtual machine number of cpus"
  default     = 1
}

variable "vsphere_virtual_machine_memory" {
  description = "vsphere vitual machine memory"
  default     = 4096
}

variable "vsphere_virtual_machine_host_name" {
  description = "vsphere virtual machine host name"
}

variable "vsphere_virtual_machine_domain" {
  description = "vsphere virtual machine domain"
}

variable "vsphere_virtual_machine_ipv4_address" {
  description = "vsphere virtual machine ipv4 address"
}

variable "vsphere_virtual_machine_ipv4_netmask" {
  description = "vsphere virtual machine ipv4 netmask"
}

variable "vsphere_virtual_machine_dns_server_list" {
  description = "vsphere virtual machine dns server list"
  type        = "list"
}

variable "vsphere_virtual_machine_dns_suffix_list" {
  description = "vsphere virtual machine dns suffix list"
  type        = "list"
}

variable "vsphere_virtual_machine_ipv4_gateway" {
  description = "vsphere virtual machine ipv4 gateway"
}

#variable "vsphere_virtual_machine_wait_for_guest_net_timeout" {
#  description = "vsphere virtual machine guest network time out value in minutes"
#  default     = 5
#}

#variable "vsphere_virtual_machine_wait_for_guest_net_routable" {
#  description = "vsphere virtual machine guest network routable wait flag"
#  default     = true
#}
