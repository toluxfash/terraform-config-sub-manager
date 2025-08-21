# resource "random_id" "bucket_id" {
#   byte_length = 4
# }

# resource "aws_s3_bucket" "receipts" {
#   bucket = "subscription-receipts-${random_id.bucket_id.hex}"
#   acl    = "private"
# }
