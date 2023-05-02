provider "aws" {
  region          = var.region
  assume_role {
    role_arn      = "arn:aws:iam::${var.account}:role/Jenkins-Role"
  }
}

module "eks_cluster" {
  source                              = "./modules/eks_cluster"
  region                              = var.region
  account                             = var.account
  vpc_id                              = var.vpc_id
  eks_cluster_name                    = var.eks_cluster_name
  subnet_ids                          = var.subnet_ids
  eks_cluster_ssh_key                 = var.eks_ssh_key
  iam_eks_cluster_role                = var.iam_eks_cluster_role
  endpoint_private_access             = var.endpoint_private_access
  map-migrated-server-id              = var.map-migrated-server-id
  ami_type                            = var.ami_type
  desired_scalesize                   = var.desired_scalesize
  disk_size                           = var.disk_size
  instance_type                       = var.instance_type
  max_scalesize                       = var.max_scalesize
  min_scalesize                       = var.min_scalesize
  aws_iam_eks_node_attach_policies    = var.aws_iam_eks_node_attach_policies
  aws_iam_eks_cluster_attach_policies = var.aws_iam_eks_cluster_attach_policies
  ingress_rules                       = var.eks_sg_ingress_rules
  cluster_version                     = var.cluster_version
  release_version                     = var.release_version
}

output "this_eks_cluster_security_group_id" {
  value = module.eks_cluster.eksClusterSecurityGroupID
}

output "node_group_role" {
  value = "${module.eks_cluster.node_group_role}"
}