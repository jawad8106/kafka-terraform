variable "clusters_region" {
    type    = "string"
    default = "us-central1"
}

variable "clusters_zones" {
    type    = "list"
    default = ["us-central1-a", "us-central1-b", "us-central1-c"]
}

variable "management_region" {
    type    = "string"
    default = "us-central1"
}

variable "management_zone" {
    type    = "string"
    default = "us-central1-a"
}

variable "monitoring_region" {
    type    = "string"
    default = "us-central1"
}

variable "monitoring_zone" {
    type    = "string"
    default = "us-central1-b"
}