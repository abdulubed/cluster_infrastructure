#!/bin/bash




# aws ec2 authorize-security-group-ingress --group-id sg-07eec00d413f690d8 --protocol tcp --port 0 --cidr 0.0.0.0/0

## New cluster 
# aws ec2 revoke-security-group-ingress \
#     --group-id sg-07eec00d413f690d8 \
#     --protocol tcp \
#     --port 0 \
#     --source-group sg-0c4550eecf927ed5e


## Old cluster 
# aws ec2 authorize-security-group-ingress \
#     --group-id sg-07eec00d413f690d8 \
#     --protocol tcp \
#     --port 5432 \
#     --source-group sg-0c4550eecf927ed5e




aws ec2 authorize-security-group-ingress \
    --group-id sg-07eec00d413f690d8 \
    --protocol tcp \
    --port 5432 \
    --source-group sg-087121b87fce5d805







# kubectl run  --image=fuchicorp/buildtools telnet curl  -- sleep 3000
# k exec -ti telnet -- bash 
# telnet czr-uat-usw2-daas-postgresdb.cblyhqclvly9.us-west-2.rds.amazonaws.com 5432
