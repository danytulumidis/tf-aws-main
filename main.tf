terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.42.0"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    bucket = "terraform-state-dtf"
    key = "terraform.tfstate"
    region = "eu-central-1"
    profile = "dany_tf"
  }
}

provider "aws" {
  region = "eu-central-1"
  profile = "dany_tf"
}