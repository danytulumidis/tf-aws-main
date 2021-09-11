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

resource "aws_s3_bucket_policy" "media_files_policy" {
  bucket = aws_s3_bucket.media_files.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "public"
    Statement = [
      {
        Sid:"PublicRead",
        Effect:"Allow",
        Principal: "*",
        Action:["s3:GetObject"],
        Resource:["arn:aws:s3:::media-files-dtf/*"]
      },
    ]
  })
}