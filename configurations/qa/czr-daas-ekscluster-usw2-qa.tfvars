## Please do not touch this location 
s3_bucket       = "czr-platform-usw2-tf-state"
account         = "353991931672"
environment     = "qa"
s3_region       = "us-west-2"
s3_folder       = "infrastructure"
s3_folder_type  = "eks"
s3_tfstate_file = "eks_cluster.tfstate"
## Please do not touch above code 


region          = "us-west-2"


## Networking setup 
vpc_id          = "vpc-01b2be1037c8a7ebc"
subnet_ids      = [
    "subnet-0faced88d649fcd40",
    "subnet-0bfdcca7042b48410",
]

eks_sg_ingress_rules = [
    {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "10.36.0.0/16"
        description = "SSH Access NEED TO CHECK"
    },
    {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "10.0.0.0/8"
        description = "HTTPS ports NEED TO CHECK"
    },
    {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "10.0.0.0/8"
        description = "HTTPS ports NEED TO CHECK"
    },
    {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "192.0.0.0/8"
        description = "Custom TCP NEED TO CHECK"
    },
    {
        from_port   = 10250
        to_port     = 10250
        protocol    = "tcp"
        cidr_block  = "10.0.0.0/8"
        description = "Custom TCP NEED TO CHECK"
    },
    {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_block  = "10.0.0.0/8"
        description = "Custom TCP NEED TO CHECK"
    },
    {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "192.168.0.0/16"
        description = "Custom TCP NEED TO CHECK"
    },
    {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "192.168.0.0/16"
        description = "Custom TCP NEED TO CHECK"
    }
]




eks_ssh_key = "daas-qa-root"


## Cluster configurations
disk_size           = 100
instance_type       = "r5a.2xlarge"
min_scalesize       = 4
max_scalesize       = 10
desired_scalesize   = 4
ami_type            = "AL2_x86_64"
eks_cluster_name                                    = "czr-qa-usw2-daas-eks" 
iam_eks_cluster_role                                = "czr-qa-usw2-daas-eks-role"


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
