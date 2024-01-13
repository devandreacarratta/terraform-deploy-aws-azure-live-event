resource "aws_s3_bucket" "s3_bucket" {
  bucket = "static-site-${random_password.password.result}"
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_ownership_controls" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "s3_bucket_website_configuration" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "public-read"
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls,
    aws_s3_bucket_public_access_block.s3_bucket_public_access_block,
  ]
}

resource "aws_s3_object" "s3_object" {
  bucket       = aws_s3_bucket.s3_bucket.bucket
  for_each     = fileset("files-to-upload/", "*")
  key          = each.value
  source       = "files-to-upload/${each.value}"
  etag         = filemd5("files-to-upload/${each.value}")
  acl          = "public-read"
  content_type = endswith(each.value, "html") ? "text/html" : "image/jpg"
}
