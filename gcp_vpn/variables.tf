variable "network" {
    description = "pcf-pcf-network"
    default = "pcf-pcf-network"
}

variable "lb_network" {
    description = "lb network"
    default = "pcf-management-subnet"
}

variable "google_region" {
    default = "us-central1"
}

variable "peer_ip" {
    default = "52.37.220.150"
}

variable "shared_secret" {
    default = "BKOBs.7B2HxNZJbUV5KkdEVAw6Jo_A4c"
}

variable "local_traffic" {
    default = "10.0.0.0/22"
}

variable "remote_traffic" {
    default = "10.0.16.0/23"
}

# variable "cf_ip" {
#     description = "cf ip"
#     default = "10.0.4.5"
# }
#
# variable "cf_wss_ip" {
#     description = "cf ip"
#     default = "10.0.4.6"
# }

variable "zones" {
  default = ["us-east1-b", "us-east1-c", "us-east1-d"]
}

variable "internal_lb_address" {
    default = "10.0.0.10"
}
