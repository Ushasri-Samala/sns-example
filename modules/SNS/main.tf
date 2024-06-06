
variable "topics" {
  description = "List of SNS topics to create"
  type        = list(string)
}

variable "endpoints" {
  description = "List of email endpoints for SNS subscriptions"
  type        = list(string)
}


resource "aws_sns_topic" "my_topics" {
  for_each = toset(var.topics)
  name     = each.key
}

locals {
  topic_endpoint_combinations = flatten([
    for topic_key, topic in aws_sns_topic.my_topics : [
      for endpoint in var.endpoints : {
        topic_name = topic_key
        topic_arn  = topic.arn
        endpoint   = endpoint
      }
    ]
  ])
}

resource "aws_sns_topic_subscription" "email_subscriptions" {
  for_each = {
    for combination in local.topic_endpoint_combinations :
    "${combination.topic_name}-${combination.endpoint}" => combination
  }

  topic_arn = each.value.topic_arn
  protocol  = "email"
  endpoint  = each.value.endpoint
}