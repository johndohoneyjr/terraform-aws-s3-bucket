terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

resource "aws_s3_bucket" "tf_code" {
    bucket = "${var.project_name}-${random_id.tf_bucket_id.dec}"
    acl = "private"
    force_destroy = true
    tags {
      Name = "John_Dohoney"
    }
}
resource "random_id" "tf_bucket_id" {
  byte_length = 2
}
