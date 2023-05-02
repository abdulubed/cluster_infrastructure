resource "aws_iam_role" "eks_cluster_nodegroup_role" {
  name = "${var.eks_cluster_name}-node-role"
  tags = {
    Name          = "${var.eks_cluster_name}-node-role"
    map-migrated  = var.map-migrated-server-id
  }

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_iam_role_policy_attachment" "node_policies" {
  count = "${length(var.aws_iam_eks_node_attach_policies)}"
  policy_arn = "${element(var.aws_iam_eks_node_attach_policies, count.index)}"
  role       = aws_iam_role.eks_cluster_nodegroup_role.name
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name      = aws_eks_cluster.eks.name
  node_group_name   = "${var.eks_cluster_name}-nodes"
  node_role_arn     = aws_iam_role.eks_cluster_nodegroup_role.arn
  subnet_ids        = var.subnet_ids
  disk_size         = var.disk_size
  instance_types    = [var.instance_type]
  ami_type          = var.ami_type
  release_version   = var.release_version

  remote_access {
    ec2_ssh_key = var.eks_cluster_ssh_key
  }

  scaling_config {
    desired_size = var.desired_scalesize
    max_size     = var.max_scalesize
    min_size     = var.min_scalesize
  }


  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_eks_cluster.eks,
    aws_iam_role_policy_attachment.node_policies
  ]

  tags = {
    Name          = "${var.eks_cluster_name}-nodes"
    map-migrated  = var.map-migrated-server-id
  }  
}

resource "aws_autoscaling_group_tag" "nodes_group" {
  autoscaling_group_name = aws_eks_node_group.eks_node_group.resources[0].autoscaling_groups[0].name
   tag {
    key   = "Name"
    value = "${var.eks_cluster_name}-node"
    propagate_at_launch = true
  }  
} 

resource "aws_autoscaling_group_tag" "nodes_group1" {
  autoscaling_group_name = aws_eks_node_group.eks_node_group.resources[0].autoscaling_groups[0].name
   tag {
    key   = "map-migrated-server-id"
    value =  var.map-migrated-server-id
    propagate_at_launch = true
  }  
} 


