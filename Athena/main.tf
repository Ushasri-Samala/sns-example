resource "aws_athena_database" "example1" {
  name   = var.athena_database_name
  bucket = var.athena_bucket_name
}

resource "aws_athena_workgroup" "athena_workgroup" {
  name        = var.athena_workgroup_name
  description = var.athena_workgroup_description
  state       = "ENABLED"
}