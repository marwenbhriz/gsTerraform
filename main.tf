// import hello module
module "hello" {
  source       = "./modules/hello"
}

// import pubsub module
module "pubsub" {
  source       = "./modules/pubsub"
}

// import address module
module "address" {
  source       = "./modules/address"
  project_name = var.accounts.project
}

// import network module
module "network" {
  source       = "./modules/network"
  project_name = var.accounts.project
  project_region = var.accounts.region
}

// import gcr module
module "gcr" {
  source       = "./modules/gcr"
  project_name = var.accounts.project
  project_region = var.accounts.region
}

// import gcs module
module "gcs" {
  source       = "./modules/gcs"
  project_region = var.accounts.region
}
