module "vpc" {

  source = "../../modules/vpc"

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnet_1_cidr = var.public_subnet_1_cidr

  public_subnet_2_cidr = var.public_subnet_2_cidr

  private_subnet_1_cidr = var.private_subnet_1_cidr

  private_subnet_2_cidr = var.private_subnet_2_cidr

  az_1 = var.az_1

  az_2 = var.az_2
}

module "iam" {

  source = "../../modules/iam"

  environment = var.environment
}

module "security_group" {

  source = "../../modules/security_group"

  environment = var.environment

  vpc_id = module.vpc.vpc_id
}

module "eks" {

  source = "../../modules/eks"

  environment = var.environment

  cluster_role_arn = module.iam.cluster_role_arn

  private_subnet_ids = module.vpc.private_subnet_ids

  security_group_id = module.security_group.security_group_id
}

module "node_group" {

  source = "../../modules/node-group"

  environment = var.environment

  cluster_name = module.eks.cluster_name

  node_role_arn = module.iam.node_role_arn

  private_subnet_ids = module.vpc.private_subnet_ids

  desired_size = var.desired_size

  min_size = var.min_size

  max_size = var.max_size

  instance_type = var.instance_type
}