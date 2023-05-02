resource "aws_security_group_rule" "ingress_rules" {
  count = length(var.ingress_rules)
  type              = "ingress"
  from_port         = var.ingress_rules[count.index].from_port
  to_port           = var.ingress_rules[count.index].to_port
  protocol          = var.ingress_rules[count.index].protocol
  cidr_blocks       = [var.ingress_rules[count.index].cidr_block]
  description       = var.ingress_rules[count.index].description
  security_group_id = data.aws_security_group.selected_eks.id
}

data "aws_security_group" "selected_eks" {
  id = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}

resource "aws_eks_cluster" "eks" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version   = var.cluster_version

  vpc_config {
    subnet_ids = var.subnet_ids
    security_group_ids = var.existing_security_group_ids
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access = false
  }

  tags = {
    Name          = var.eks_cluster_name
    map-migrated  = var.map-migrated-server-id
  }

  enabled_cluster_log_types = ["api", "audit", "controllerManager", "scheduler", "authenticator"]

  depends_on = [
    aws_iam_role_policy_attachment.cluster_policies,
  ]

  lifecycle {
    create_before_destroy = true
  }
}
# terraform import -var-file=$DATAFILE  module.eks_cluster.aws_eks_node_group.eks_node_group "czr-qa-usw2-daas-eks:czr-qa-usw2-daas-eks-nodes"
# terraform import -var-file=$DATAFILE module.eks_cluster.aws_eks_cluster.eks "czr-qa-usw2-daas-eks"