terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket         = "devops-tf-chadduffey"
    key            = "tf-state-setup"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "devops-recipie-app-api-tf-lock"
  }
}

provider "aws" {
  region = "us-west-2"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }
}
