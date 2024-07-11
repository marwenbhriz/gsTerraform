variable "network_name" {
  type = string
  default = "githubaction-vpc"
}

variable "subnetwork_name" {
  type = string
  default = "githubaction-subnetwork"
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