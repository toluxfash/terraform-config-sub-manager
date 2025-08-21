output "vpc_id" {
  value = aws_vpc.main.id
}

# # output "ec2_public_ip" {
# #  
# value = aws_instance.app.public_ip
# # }

output "alb_dns" {
  value = aws_lb.app_lb.dns_name
}

# output "s3_bucket_name" {
#   value = aws_s3_bucket.receipts.bucket
# }
output "rds_endpoint" {
  value = aws_db_instance.mysql.endpoint
}
