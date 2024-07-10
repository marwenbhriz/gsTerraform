variable "network_name" {
  type = string
  default = "benhriz-vpc"
}

variable "subnetwork_name" {
  type = string
  default = "benhriz-subnetwork"
}

variable "ip_cidr_range" {
  type = string
  default = "10.0.1.0/24"
}

variable "project_name" {
  type = string
}

variable "project_region" {
  type = string
}