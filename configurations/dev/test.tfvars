## Please do not touch this location 
s3_bucket       = "czr-platform-usw2-tf-state"
account         = "741762191802"
environment     = "dev"
s3_region       = "us-west-2"
s3_folder       = "cluster_infrastructure"
s3_folder_type  = "eks"
s3_tfstate_file = "test.tfstate"
## Please do not touch above code 

region          = "us-west-2"

## Networking setup 
vpc_id          = "vpc-03ae556cfafb88d3f"
subnet_ids      = [
    "subnet-05322910d7d04e94c",
    "subnet-0258d4129c8bcfb45",
]

eks_sg_ingress_rules = [
{
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "10.0.0.0/8"
        description = "Elastic Kubernetes Secure Shell"
    },
    {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "192.168.0.0/16"
        description = "Elastic Kubernetes Secure Shell"
    },
    {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "192.168.0.0/16"
        description = "Ingress controller default port."
    },
    {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "10.0.0.0/8"
        description = "Ingress controller default port."
    },
]
## End networking setup 

## Cluster configurations
eks_cluster_name        = "test-eks"
iam_eks_cluster_role    = "test-role"
disk_size               = 100
instance_type           = "t3.medium"
min_scalesize           = 1
max_scalesize           = 2
desired_scalesize       = 2
ami_type                = "AL2_x86_64"
eks_ssh_key             = "czr-raas-keypair-usw2-dev-eks-rewards-app"
cluster_version         = "1.22"
release_version         = "1.22.17-20230217"
aws_iam_eks_cluster_attach_policies = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSServicePolicy",
    "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController",
    "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
]

aws_iam_eks_node_attach_policies = [ 
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
]
