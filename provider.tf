provider "aws" {
  version                 = "~> 2.53"
  region                  = var.aws_region
  profile                 = var.aws_profile
  allowed_account_ids     = [var.aws_account_id]
}
