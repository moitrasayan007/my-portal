provider "aws" {
  region = "${{ values.aws_region }}"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "${{ values.cluster_name }}"
  cluster_version = "1.31"

  vpc_id     = "vpc-123456" # In a real scenario, you'd pass this as a variable
  subnet_ids = ["subnet-abc", "subnet-def"]

  eks_managed_node_groups = {
    main = {
      min_size     = 1
      max_size     = 3
      desired_size = 2
      instance_types = ["t3.medium"]
    }
  }
}