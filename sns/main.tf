resource "aws_sns_topic" "event_topic" {
  name = var.topic_name
  tags = var.tags
}


