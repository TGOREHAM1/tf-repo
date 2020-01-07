resource "aws_cloudwatch_log_group" "tf_cw_logs" {
  name = "${var.instance_name}-log-group"
  retention_in_days = 7
}
