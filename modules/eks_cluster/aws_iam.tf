resource "aws_iam_role" "eks_cluster_role" {
  name = var.iam_eks_cluster_role

  tags = {
    Name          = var.iam_eks_cluster_role
    map-migrated  = var.map-migrated-server-id
  }

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
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

resource "aws_iam_role_policy_attachment" "cluster_policies" {
  count = "${length(var.aws_iam_eks_cluster_attach_policies)}"
  policy_arn = "${element(var.aws_iam_eks_cluster_attach_policies, count.index)}"
  role       = aws_iam_role.eks_cluster_role.name
  lifecycle {
    create_before_destroy = true
  }
}