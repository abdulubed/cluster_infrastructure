## Please do not touch this location 
s3_bucket       = "czr-platform-usw2-tf-state"
account         = "238837397276"
environment     = "prod"
s3_region       = "us-west-2"
s3_folder       = "infrastructure"
s3_folder_type  = "eks"
s3_tfstate_file = "eks_cluster.tfstate"
## Please do not touch above code 


region          = "us-west-2"


## Networking setup 
vpc_id          = "vpc-06876ebcc2ce3b5d6"
subnet_ids      = [
    "subnet-0863248817b7e2f1a",
    "subnet-0233a6e45228b0b3e",
]

## Ingress Security Groups 
eks_sg_ingress_rules = [
    {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "10.36.0.0/16"
        description = "Elastic Kubernetes Services Secure Shell"
    },
    {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "10.0.0.0/8"
        description = "Ingress Controllers defaults ports 443 and 80"
    },
    {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "192.168.0.0/16"
        description = "Ingress Controllers defaults ports 443 and 80"
    },
    {
        from_port   = 30001
        to_port     = 30001
        protocol    = "tcp"
        cidr_block  = "10.0.0.0/8"
        description = "Airflow default port"
    },
    {
        from_port   = 30001
        to_port     = 30001
        protocol    = "tcp"
        cidr_block  = "192.0.0.0/8"
        description = "Airflow default port"
    },
    {
        from_port   = 30001
        to_port     = 30001
        protocol    = "tcp"
        cidr_block  = "192.168.0.0/16"
        description = "Airflow default port"
    },
]

## End networking setup 


## Cluster configurations
disk_size           = 100
instance_type       = "r5a.2xlarge"
min_scalesize       = 2
max_scalesize       = 10
desired_scalesize   = 4
ami_type            = "AL2_x86_64"
eks_ssh_key         = "daas-prod-root"
eks_cluster_name                                    = "czr-prod-usw2-daas-eksclusters"
iam_eks_cluster_role                                = "czr-prod-usw2-iam-eks-clusters-role"

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

