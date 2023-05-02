


## Assume Shared Tools
source assume 586467197160

aws s3 cp eks_cluster.tfstate s3://czr-platform-usw2-tf-state/state/574299803363/prod/us-west-2/infrastructure/eks/eks_cluster.tfstate



## Download
aws s3 cp s3://czr-uat-usw2-raas-infrastructure/infrastructure/us-west-2/eks/uat/eks_cluster.tfstate . 
## Upload
aws s3 cp eks_cluster.tfstate s3://czr-platform-usw2-tf-state/state/488513616762/uat/us-west-2/infrastructure/eks/eks_cluster.tfstate


## Cluster confiuration is old
aws s3 cp s3://czr-qa-usw2-daas-infrastructure/infrastructure/us-west-2/eks/daas/eks_cluster.tfstate .
aws s3 cp eks_cluster.tfstate s3://czr-platform-usw2-tf-state/state/353991931672/qa/us-west-2/infrastructure/eks/eks_cluster.tfstate 


aws ec2 create-key-pair --key-name daas-qa-root >  ~/.ssh/daas-qa-root.json

aws ec2 create-key-pair --key-name daas-qa-root --dry-run


aws ec2 describe-key-pairs