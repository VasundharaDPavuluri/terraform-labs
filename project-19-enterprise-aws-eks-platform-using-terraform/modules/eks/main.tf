resource "aws_eks_cluster" "this" {

  name = "${var.environment}-eks-cluster"

  role_arn = var.cluster_role_arn

  vpc_config {

    subnet_ids = var.private_subnet_ids

    security_group_ids = [
      var.security_group_id
    ]
  }

  depends_on = [
    var.cluster_role_arn
  ]
}