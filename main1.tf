terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
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
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow",
        Action   = "*",
        Resource = "*"
      }
    ]
  })
}

# attach the policy using the aws_iam_policy_attachment resource
resource "aws_iam_user_policy_attachment" "folaR_admin_access" {
  user       = aws_iam_user.folarin.name
  policy_arn = aws_iam_policy.admin.arn
}

# an s3 bucket for the product team
resource "aws_s3_bucket" "product_team" {
  bucket = "product-01"
  tags = {
    description = "product lifecycle"
  }
}

# add an object to the bucket
resource "aws_s3_object" "product-doc" {
  bucket = aws_s3_bucket.product_team.id
  key    = "new_product"
  source = "productteam.txt"
}

# to grant a group access to the s3 object, first create a data source that allows tf read the attributes of the group.
resource "aws_iam_group" "product-data" {
  name = "product-teams"
  path = "/"
}

# to allow the group access to your s3, create an s3 bucket policy using the iam group's arn
# resource "aws_s3_bucket_policy" "product-policy" {
#   bucket = aws_s3_bucket.product_team.id
#   # define the policy
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action   = "*"
#         Effect   = "Allow"
#         Resource = "arn:aws:s3:::${aws_s3_bucket.product_team.id}/*"
#         Principal = {
#           "AWS" = [
#             "${resource.aws_iam_group.product-data.arn}"
#           ]
#         }
#       }
#     ]
#   })
# }

# dynamodb
resource "aws_dynamodb_table" "devs" {
  name         = "devs"
  hash_key     = "VIN"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "VIN"
    type = "S"
  }
}