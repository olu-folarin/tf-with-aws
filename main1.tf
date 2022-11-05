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

# identityand access management config for the admin
resource "aws_iam_user" "folarin" {
    name = "folarin"
    tags = {
      description = "Technical Team Leader and migration craftsman"
    }
}