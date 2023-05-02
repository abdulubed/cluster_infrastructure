## Terrafom tfstate configuration 
environment = "preprod"
s3_bucket = "czr-preprod-usw2-daas-infrastructure"
s3_folder = "infrastructure"
s3_region = "us-west-2"
s3_folder_type = "eks"
s3_tfstate_file = "eks_cluster.tfstate"
## End terrafom tfstate configuration 


region          = "us-west-2"
account         = "238837397276"

## Networking setup 
vpc_id          = "vpc-06876ebcc2ce3b5d6"
subnet_ids      = [
    "subnet-0233a6e45228b0b3e",
    "subnet-0863248817b7e2f1a",
]
cluster_security_group_allowed_cidr_blocks = [
    "10.0.0.0/8",
    "192.168.0.0/16"
]
## End networking setup 

## Cluster configurations
disk_size           = 50
instance_type       = "r5a.2xlarge"
min_scalesize       = 2
max_scalesize       = 4
desired_scalesize   = 3
ami_type            = "AL2_x86_64"
eks_cluster_name                                    = "czr-preprod-usw2-daas-ekscluster"
iam_eks_cluster_role                                = "czr-preprod-usw2-iam-eks-cluster-role"


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


