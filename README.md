# Cluster infrastructure documentions

Welcome to Cluster infrastructure documentation. This repo will deploy Elastic Kubernetes Service EKS  on top of your Amazon Web Services. Please follow the steps to deploy your cluster to multiple accounts


## Deployment
First you will need to  clone the repo
```
git clone https://code.caesars-dev.com/Infra-as-a-service/cluster_infrastructure.git
```


After you have cloned you can create your own configuration or apply changes to existing configuration. All configurations are stored `configurations` folder see example `configurations/TOOLS/tools_us-west-2_core_eksclusters.tfvars`
```
vim configurations/TOOLS/tools_us-west-2_core_eksclusters.tfvars
```


After you have the configuration you need to get access to cluster
```
export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"
```

Verify the access by running 
```
aws sts get-caller-identity
```


After you see the command is successfully finished you can go ahead and deploy it
```
source set-env.sh  configurations/TOOLS/tools_us-west-2_core_eksclusters.tfvars
terraform apply --var-file=$DATAFILE
```
