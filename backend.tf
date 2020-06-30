resource "aws_s3_bucket" "tfstatebucket" {
  bucket = "development-tf-states-eu-west-1"
  acl    = "private"
  depends_on = [var.s3_depends_on]

  # We want to have versioning enabled, because it allows us to keep track of
  # the Terraform state history
  versioning {
    enabled = true
  }

  # We also want to make sure our bucket enables server-side encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.env_tags 
}

resource "aws_dynamodb_table" "tfstatedynamotable" {
  name            = "rl.tfstate"
  hash_key        = "LockID"
  read_capacity   = 5
  write_capacity  = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.env_tags 
  depends_on = [aws_s3_bucket.tfstatebucket]
}
