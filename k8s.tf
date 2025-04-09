module "vpc" {
  source                = "./module/vpc"

  region                = var.region
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet1_cidr  = var.private_subnet1_cidr
  private_subnet2_cidr  = var.private_subnet2_cidr
  az1                   = var.az1
  az2                   = var.az2
}

module "cluster_nodes" {
  source = "./cluster-nodes"

  ubuntu_ami           = "ami-0e35ddab05955cf57"
  key_name             = "prod-key"

  public_subnet_id     = module.vpc.public_subnet_id
  private_subnet1_id   = module.vpc.private_subnet_1_id
  private_subnet2_id   = module.vpc.private_subnet_2_id

  bastion_sg_id        = aws_security_group.bastion_sg.id
  control_plane_sg_id  = aws_security_group.control_plane_sg.id
}

