resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-dtf"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    "terraform" = true
  }
}

resource "aws_s3_bucket" "media_files" {
  bucket = "media-files-dtf"
  acl    = "public-read"
}