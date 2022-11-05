terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# identityand access management config for the admin
resource "aws_iam_user" "folarin" {
    name = "folaR"
    tags = {
      description = "Technical Team Leader and migration craftsman"
    }
}