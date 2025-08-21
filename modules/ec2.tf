# resource "aws_key_pair" "deployer" {
#   key_name   = "project-key"
#   public_key = file(var.public_key_path)
# }

# resource "aws_instance" "app" {
#   ami                    = "ami-0c2b8ca1dad447f8a"
#   instance_type          = var.instance_type
#   subnet_id              = aws_subnet.public_a.id
#   vpc_security_group_ids = [aws_security_group.app_sg.id]
#   key_name               = aws_key_pair.deployer.key_name

  
#   tags = {
#     Name = "SubscriptionApp"
#   }
# }
