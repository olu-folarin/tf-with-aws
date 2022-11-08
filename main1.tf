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

# giving access/permissions to the user above
resource "aws_iam_policy" "admin" {
  name = "AdminUser"
  policy = jsonencode({
    "version": "0212-10-17",
    "statement": [
      {
        "Effect": "Allow",
        "Action": "*",
        "Resource": "*"
      }
    ]
  })
}

# attach the policy using the aws_iam_policy_attachment resource
resource "aws_iam_user_policy_attachment" "folaR_admin_access" {
  user = aws_iam_user.folarin.name
  policy_arn = aws_iam_policy.admin.arn
}