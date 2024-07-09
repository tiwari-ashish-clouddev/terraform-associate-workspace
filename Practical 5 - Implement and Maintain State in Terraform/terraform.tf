terraform {

  required_version = ">= 1.5.0"

  #   backend "s3" {
  #     bucket         = "my-terraform-state-store-prac"
  #     region         = "ap-south-1"
  #     key            = "develop/aws-infra"
  #     dynamodb_table = "terraform-locking-info"
  #     encrypt        = true
  #   }

  #   backend "http" {
  #     address = "http://localhost:9090/api/terraform/state"
  #   }

  #   backend "remote" {
  #     hostname     = "app.terraform.io"
  #     organization = "self-practice-org"
  #     workspaces {
  #       name = "my-aws-app"
  #     }
  #   }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

}