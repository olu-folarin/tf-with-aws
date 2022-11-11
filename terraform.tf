# configuring the backend to store the state file
terraform {
  backend "s3" {
    bucket = "folarin-terraform-state-bucket0"
    key = "product/terraform.tfstate"
    region = var.region
    dynamodb_table = "state-locking"
  }
}