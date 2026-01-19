# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"] # Canonical

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-noble-24.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

resource "aws_instance" "ec2" {
  ami = "resolve:ssm:/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"

  instance_type = "t3.small"
  subnet_id = aws_subnet.subnet.id
  vpc_security_group_ids = [ aws_security_group.web.id ]
  key_name = var.key_name

  user_data = file("${path.module}/bootstrap.sh")
  
  tags = {
    Name = "saas-app-server"
  }
}