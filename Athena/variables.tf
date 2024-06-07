variable "athena_database_name" {
  description = "The name of the Athena database"
  type        = string
  default     = "netflix_database_usha"
}

variable "athena_bucket_name" {
  description = "The name of the S3 bucket for Athena query results"
  type        = string
  default     = "athena-netflix-bucket"
}

variable "athena_workgroup_name" {
  description = "The name of the Athena workgroup"
  type        = string
  default     = "aws_athena_workgroup"
}

variable "athena_workgroup_description" {
  description = "The description of the Athena workgroup"
  type        = string
  default     = "Example Athena workgroup"
}
