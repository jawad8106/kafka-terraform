provider "google" {
  credentials = "service_account.json"
  project     = "kafka-gcp-262322"
  region      = "us-central1"
  zone        = "us-central1-a"
  
}

module "network" {
  source = "./modules/gcp-network"
  clusters_region = "${var.clusters_region}"
  management_region = "${var.management_region}"
  monitoring_region = "${var.monitoring_region}"
}

module "zookeeper" {
  source = "./modules/zookeeper"
  servers = "3"
  subnet = "${module.network.kafka_subnet}"
  zones = "${var.clusters_zones}"
}

module "kafka" {
  source = "./modules/kafka"
  servers = "3"
  subnet = "${module.network.kafka_subnet}"
  zones = "${var.clusters_zones}"
  zookeeper_up = "${module.zookeeper.cluster_up}"
}

module "management" {
  source = "./modules/management"
  subnet = "${module.network.management_subnet}"
  zone = "${var.management_zone}"
}

module "monitoring" {
  source = "./modules/monitoring"
  subnet = "${module.network.monitoring_subnet}"
  zone = "${var.monitoring_zone}"
}