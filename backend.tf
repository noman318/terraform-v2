terraform {
  backend "s3" {
    bucket = "27102026-be-tf-noman"
    region = "ap-south-1"
    key = "noman-tf/terraform.tfstate"
  }
}