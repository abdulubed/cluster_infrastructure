output "eksClusterSecurityGroupID" {
  value = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}

output "node_group_role" {
  value = "${var.eks_cluster_name}-node-role"
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "eks_cluster_certificate_authority" {
  value = aws_eks_cluster.eks.certificate_authority
}

output "vpc_id_from_first_a1-vpc_module" {
  value = var.vpc_id
}
