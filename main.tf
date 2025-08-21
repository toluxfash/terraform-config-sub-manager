module "subscription_app" {
  source           = "./modules"
  aws_region       = var.aws_region
  vpc_cidr         = var.vpc_cidr
  public_subnet_a  = var.public_subnet_a
  public_subnet_b  = var.public_subnet_b
  private_subnet_a = var.private_subnet_a
  private_subnet_b = var.private_subnet_b
  instance_type    = var.instance_type
  key_name         = var.key_name
  app_port         = var.app_port
  db_username      = var.db_username
  db_password      = var.db_password
  ec2_cidr         = var.ec2_cidr
}
