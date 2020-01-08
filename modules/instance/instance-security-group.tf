resource "aws_security_group" "tf_security_group" {
  description = "Allows HTTP & conditional SSH access"
  name_prefix = "${var.instance_name}-"
}

resource "aws_security_group_rule" "allow_http" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf_security_group.id
}

resource "aws_security_group_rule" "allow_ssh" {
  count = var.instance_allow_ssh == true ? 1 : 0
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf_security_group.id
}

resource "aws_security_group_rule" "allow_egress_all" {
  type = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tf_security_group.id 
}