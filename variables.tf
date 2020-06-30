variable "allowed_account_ids" {
  description = "List of allowed AWS account ids where resources can be created"
  type        = list(string)
  default     = []
}

variable "aws_account_id" {
  type        = string
  description = "Your AWS account ID"
}

variable "aws_region" {
  type        = string
  description = "Your AWS region"
  default     = ""
}

variable "aws_profile" {
  type        = string
  description = "Your AWS profile"
}

variable "env_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = { }
}

variable "s3_depends_on" {
  type    = any
  default = null
}
