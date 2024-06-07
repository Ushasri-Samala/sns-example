

resource "aws_cloudwatch_dashboard" "ec2_dashboard" {
  dashboard_name = "EC2_Instance_Monitoring"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x = 0,
        y = 0,
        width = 12,
        height = 6,
        properties = {
          view = "timeSeries",
          title = "EC2 CPU Utilization",
          region = var.aws_region,
          metrics = [
            [ "AWS/EC2", "CPUUtilization", "InstanceId", var.ec2_instance_id ]
          ],
          period = 300,
          stat = "Average",
          start = "-PT3H",
          end = "PT0H"
        }
      },
      {
        type = "metric",
        x = 0,
        y = 6,
        width = 12,
        height = 6,
        properties = {
          view = "timeSeries",
          title = "EC2 Disk Read/Write",
          region = var.aws_region,
          metrics = [
            [ "AWS/EC2", "DiskReadBytes", "InstanceId", var.ec2_instance_id ],
            [ ".", "DiskWriteBytes", ".", "." ]
          ],
          period = 300,
          stat = "Average",
          start = "-PT3H",
          end = "PT0H"
        }
      }
    ]
  })
}