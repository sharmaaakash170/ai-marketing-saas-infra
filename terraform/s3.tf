resource "aws_s3_bucket" "frontend" {
  bucket = "${var.project_name}-frontend"
  tags = {
    Name = "${var.project_name}-frontend"
  }
}