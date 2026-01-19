resource "aws_security_group" "web" {
  name = "saas-web-sg"
  vpc_id = aws_vpc.vpc.id  
}

resource "aws_security_group_rule" "ssh" {
  security_group_id = aws_security_group.web.id
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = [ "103.197.74.0/24" ]
  type = "ingress"
}

resource "aws_security_group_rule" "http" {
  security_group_id = aws_security_group.web.id
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  type = "ingress"
}

resource "aws_security_group_rule" "https" {
  security_group_id = aws_security_group.web.id
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  type = "ingress"
}

resource "aws_security_group_rule" "outbound" {
  security_group_id = aws_security_group.web.id
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [ "0.0.0.0/0" ]
  type = "egress"
}