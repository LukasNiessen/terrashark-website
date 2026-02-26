terraform {
  required_version = ">= 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terrashark-website-tfstate"
    key            = "website/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terrashark-website-tflock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project   = "terrashark-website"
      ManagedBy = "terraform"
      Stack     = "website"
    }
  }
}
