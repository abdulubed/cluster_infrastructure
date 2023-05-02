## Please do not touch this location 
s3_bucket       = "czr-platform-usw2-tf-state"
environment     = "prod"
s3_region       = "us-west-2"
s3_folder       = "cluster_infrastructure"
s3_folder_type  = "eks"
s3_tfstate_file = "eks_cluster.tfstate"
## Please do not touch above code 

region          = "us-west-2"
account         = "121054486353"

## Networking setup 
vpc_id          = "vpc-0be93057a37888aa2"
subnet_ids      = [
    "subnet-0de0b4ea92c1c2d0f",
    "subnet-0b3420413b5a7bc8f",
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
disk_size           = 100
instance_type       = "r5a.2xlarge"
min_scalesize       = 2
max_scalesize       = 4
desired_scalesize   = 3
ami_type            = "AL2_x86_64"
eks_ssh_key         = "raas-prod-root"
eks_cluster_name      = "czr-prod-usw2-raas-eksclusters"
iam_eks_cluster_role  = "czr-prod-usw2-iam-eks-clusters-role"
cluster_version     = "1.24"
release_version     = "1.24.7-20221222"

aws_iam_eks_cluster_attach_policies = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSServicePolicy",
    "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController",
    "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
]


aws_iam_eks_node_attach_policies = [ 
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
]

