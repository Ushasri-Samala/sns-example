variable "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  type        = string
  default     = "i-005097d896d2ba593"  # Replace with your actual instance ID
}

variable "aws_region" {
  description = "The AWS region where the resources are located"
  type        = string
  default     = "us-east-1"  # Replace with your actual AWS region
}