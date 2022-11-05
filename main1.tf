terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = var.version
    }
  }
}

provider {
  region = var.region
}