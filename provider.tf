terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "~> 1.16.1"
    }
    cloudfoundry = {
      source  = "cloudfoundry/cloudfoundry"
      version = "~> 1.9.0"
    }
  }
}

provider "btp" {
  globalaccount = var.globalaccount
}

provider "cloudfoundry" {
  api_url = var.api_url
}
