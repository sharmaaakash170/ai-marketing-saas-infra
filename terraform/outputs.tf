output "ec2_public_ip" {
  value = aws_instance.ec2.public_ip
}


output "frontend_url" {
  value = aws_cloudfront_distribution.cf.domain_name
}

output "frontend_bucket" {
  value = aws_s3_bucket.frontend.bucket
}
