resource "aws_cloudwatch_metric_alarm" "es-cpu-utilization" {
  alarm_name                = "es-cpu-utilization-above-80"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/ES"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors es cpu utilization"
  alarm_actions             = ["${var.monitoring_topic_arn}"]
  insufficient_data_actions = []
  #need to see what are the dimensions to identify all the instances
  dimensions {
    DomainId = "${var.es_domain_id}"
  }
}