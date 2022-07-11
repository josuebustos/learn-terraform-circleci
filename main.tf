provider "aws" {
  region = var.region

  default_tags {
    tags = {
      hashicorp-learn = "circleci"
    }
  }
}
variable "website_root" {
  type        = string
  description = "Path to the root of website content"
  default     = "./assets/index.html"
}

resource "aws_s3_bucket" "my_static_website" {
  bucket = "blog-example-m9wtv64y"
  acl    = "private"

  website {
    index_document = "index.html"
  }
}

# To print the bucket's website URL after creation
output "website_endpoint" {
  value = aws_s3_bucket.my_static_website.website_endpoint
}
