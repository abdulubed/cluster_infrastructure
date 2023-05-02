## Terrafom tfstate configuration 
environment = "dev"
s3_bucket = "czr-dev-usw2-uw-infrastructure"
s3_folder = "infrastructure"
s3_region = "us-west-2"
s3_folder_type = "eks"
s3_tfstate_file = "eks_cluster.tfstate"
## End terrafom tfstate configuration 


region          = "us-west-2"
account         = "763602393417"

## Networking setup 
vpc_id          = "vpc-0561d5da86cd2faab"
subnet_ids      = [
    "subnet-06c0107c6cfa670f7",
    "subnet-081c3d2fb17e9a52f",
]

eks_ssh_key = "uw-root-key"

## End networking setup 

## Cluster configurations
disk_size           = 50
instance_type       = "t3.medium"
min_scalesize       = 2
max_scalesize       = 4
desired_scalesize   = 3
ami_type            = "AL2_x86_64"
eks_cluster_name                                    = "czr-dev-usw2-uw-ekscluster"
iam_eks_cluster_role                                = "czr-dev-usw2-iam-eks-cluster-role"


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