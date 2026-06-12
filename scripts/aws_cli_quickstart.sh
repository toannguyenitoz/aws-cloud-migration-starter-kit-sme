#!/bin/bash
set -euo pipefail

# AWS CLI quick checks for the cloud migration lab.
# Run this from AWS CloudShell or a configured admin workstation.

echo "Caller identity:"
aws sts get-caller-identity

echo "Configured region:"
aws configure get region

echo "VPCs:"
aws ec2 describe-vpcs --query "Vpcs[*].{VpcId:VpcId,Cidr:CidrBlock,Default:IsDefault}" --output table

echo "S3 buckets:"
aws s3 ls

echo "CloudTrail trails:"
aws cloudtrail describe-trails --query "trailList[*].Name" --output table
